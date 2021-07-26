Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C9B3D58E2
	for <lists.iommu@lfdr.de>; Mon, 26 Jul 2021 13:54:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61367837B6;
	Mon, 26 Jul 2021 11:54:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YJxgqfRGaBbm; Mon, 26 Jul 2021 11:54:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8C4058379C;
	Mon, 26 Jul 2021 11:54:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F740C001F;
	Mon, 26 Jul 2021 11:54:55 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EF84EC000E
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 11:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB8F860708
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 11:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k38LJxLGFpgr for <iommu@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 11:54:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 56B87606B6
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 11:54:53 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 8E53D46E; Mon, 26 Jul 2021 13:54:50 +0200 (CEST)
Date: Mon, 26 Jul 2021 13:54:49 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: [PATCH,RFC] iommu/amd: Use report_iommu_fault()
Message-ID: <YP6iiR8wuszflhnN@8bytes.org>
References: <YPVL41ZO8Ih8WrKa@wantstofly.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPVL41ZO8Ih8WrKa@wantstofly.org>
Cc: iommu@lists.linux-foundation.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development issues for Linux IOMMU support
 <iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
 <mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

Hi Lennert,

On Mon, Jul 19, 2021 at 12:54:43PM +0300, Lennert Buytenhek wrote:
> +	if (dev_data) {
> +		int report_flags;
> +
> +		/*
> +		 * AMD I/O Virtualization Technology (IOMMU) Specification,
> +		 * revision 3.00, section 2.5.3 ("IO_PAGE_FAULT Event") says
> +		 * that the RW ("read-write") bit is only valid if the I/O
> +		 * page fault was caused by a memory transaction request
> +		 * referencing a page that was marked present.
> +		 */
> +		report_flags = 0;
> +		if ((flags & (EVENT_FLAG_TR | EVENT_FLAG_PR | EVENT_FLAG_I)) ==
> +								EVENT_FLAG_PR) {
> +			if (flags & EVENT_FLAG_RW)
> +				report_flags |= IOMMU_FAULT_WRITE;
> +			else
> +				report_flags |= IOMMU_FAULT_READ;
> +		}
> +
> +		if (!report_iommu_fault(&dev_data->domain->domain,
> +					&pdev->dev, address, report_flags))
> +			goto out;
> +	}

I'd like to limit calling report_iommu_fault() to dma-faults and leave
IRQ remapping faults unreported. The IOMMU layer does not really care a
lot about IRQs and a potential domain handler will also not be prepared
to handler IRQ specific faults (there is no generic way to detect them).

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
