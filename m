Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA9141AC65
	for <lists.iommu@lfdr.de>; Tue, 28 Sep 2021 11:55:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C30BC401F7;
	Tue, 28 Sep 2021 09:55:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AJ0yHewvH8_X; Tue, 28 Sep 2021 09:55:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BCD61401A0;
	Tue, 28 Sep 2021 09:55:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 84FA8C0022;
	Tue, 28 Sep 2021 09:55:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3C9DFC000D
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 09:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C22080DF6
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 09:55:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b3yAn1Bhfzux for <iommu@lists.linux-foundation.org>;
 Tue, 28 Sep 2021 09:55:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9695180DB3
 for <iommu@lists.linux-foundation.org>; Tue, 28 Sep 2021 09:55:05 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id B794F2FF; Tue, 28 Sep 2021 11:55:03 +0200 (CEST)
Date: Tue, 28 Sep 2021 11:55:00 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: [PATCH v4] iommu/amd: Use report_iommu_fault()
Message-ID: <YVLmdD7s68r9ngNZ@8bytes.org>
References: <YU8vmufv54arwMOa@wantstofly.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YU8vmufv54arwMOa@wantstofly.org>
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

On Sat, Sep 25, 2021 at 05:18:02PM +0300, Lennert Buytenhek wrote:
> +#define IS_IOMMU_MEM_TRANSACTION(flags)		\
> +	(((flags) & EVENT_FLAG_I) == 0)
> +
> +#define IS_WRITE_REQUEST(flags)			\
> +	((flags) & EVENT_FLAG_RW)
> +
>  static void amd_iommu_report_page_fault(u16 devid, u16 domain_id,
>  					u64 address, int flags)
>  {
> @@ -484,6 +490,18 @@ static void amd_iommu_report_page_fault(u16 devid, u16 domain_id,
>  	if (pdev)
>  		dev_data = dev_iommu_priv_get(&pdev->dev);
>  
> +	/*
> +	 * If this is a DMA fault (for which the I(nterrupt) bit will
> +	 * be unset), allow report_iommu_fault() to prevent logging it.
> +	 */
> +	if (dev_data && IS_IOMMU_MEM_TRANSACTION(flags)) {
> +		if (!report_iommu_fault(&dev_data->domain->domain,
> +					&pdev->dev, address,
> +					IS_WRITE_REQUEST(flags) ?
> +					IOMMU_FAULT_WRITE : IOMMU_FAULT_READ))
> +			goto out;

This is better placed inside the 'if (dev_data)' statement below.

Otherwise it looks good to me.


Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
