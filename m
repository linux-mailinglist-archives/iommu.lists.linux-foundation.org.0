Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6C83D6283
	for <lists.iommu@lfdr.de>; Mon, 26 Jul 2021 18:26:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9AE426078A;
	Mon, 26 Jul 2021 16:26:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AwW_rUDhmwad; Mon, 26 Jul 2021 16:26:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B4BCA60771;
	Mon, 26 Jul 2021 16:26:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 813A9C001F;
	Mon, 26 Jul 2021 16:26:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32782C000E
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 16:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 204996067C
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 16:26:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YRcIhzMj2vf8 for <iommu@lists.linux-foundation.org>;
 Mon, 26 Jul 2021 16:26:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.wantstofly.org (hmm.wantstofly.org [213.239.204.108])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3255A605F1
 for <iommu@lists.linux-foundation.org>; Mon, 26 Jul 2021 16:26:15 +0000 (UTC)
Received: by mail.wantstofly.org (Postfix, from userid 1000)
 id 635F97F46A; Mon, 26 Jul 2021 19:26:12 +0300 (EEST)
Date: Mon, 26 Jul 2021 19:26:12 +0300
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH,RFC] iommu/amd: Use report_iommu_fault()
Message-ID: <YP7iJC9Dnvh5Wi+f@wantstofly.org>
References: <YPVL41ZO8Ih8WrKa@wantstofly.org>
 <YP6iiR8wuszflhnN@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YP6iiR8wuszflhnN@8bytes.org>
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

On Mon, Jul 26, 2021 at 01:54:49PM +0200, Joerg Roedel wrote:

> Hi Lennert,

Hi Joerg,


> On Mon, Jul 19, 2021 at 12:54:43PM +0300, Lennert Buytenhek wrote:
> > +	if (dev_data) {
> > +		int report_flags;
> > +
> > +		/*
> > +		 * AMD I/O Virtualization Technology (IOMMU) Specification,
> > +		 * revision 3.00, section 2.5.3 ("IO_PAGE_FAULT Event") says
> > +		 * that the RW ("read-write") bit is only valid if the I/O
> > +		 * page fault was caused by a memory transaction request
> > +		 * referencing a page that was marked present.
> > +		 */
> > +		report_flags = 0;
> > +		if ((flags & (EVENT_FLAG_TR | EVENT_FLAG_PR | EVENT_FLAG_I)) ==
> > +								EVENT_FLAG_PR) {
> > +			if (flags & EVENT_FLAG_RW)
> > +				report_flags |= IOMMU_FAULT_WRITE;
> > +			else
> > +				report_flags |= IOMMU_FAULT_READ;
> > +		}
> > +
> > +		if (!report_iommu_fault(&dev_data->domain->domain,
> > +					&pdev->dev, address, report_flags))
> > +			goto out;
> > +	}
> 
> I'd like to limit calling report_iommu_fault() to dma-faults and leave
> IRQ remapping faults unreported. The IOMMU layer does not really care a
> lot about IRQs and a potential domain handler will also not be prepared
> to handler IRQ specific faults (there is no generic way to detect them).

I'm sorry -- this appears to have been a stupid oversight on my
part.  New patch coming up.


Thanks,
Lennert
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
