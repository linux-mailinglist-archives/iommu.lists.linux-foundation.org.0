Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4136B34D2A4
	for <lists.iommu@lfdr.de>; Mon, 29 Mar 2021 16:46:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF074830FB;
	Mon, 29 Mar 2021 14:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zfaSKrKK6-_X; Mon, 29 Mar 2021 14:46:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 180D783189;
	Mon, 29 Mar 2021 14:46:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E889DC000A;
	Mon, 29 Mar 2021 14:46:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7313C000A
 for <iommu@lists.linux-foundation.org>; Mon, 29 Mar 2021 14:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A11D0402D7
 for <iommu@lists.linux-foundation.org>; Mon, 29 Mar 2021 14:46:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=kernel.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AOIu-h3Is5d5 for <iommu@lists.linux-foundation.org>;
 Mon, 29 Mar 2021 14:45:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 710E1402CE
 for <iommu@lists.linux-foundation.org>; Mon, 29 Mar 2021 14:45:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02A9F60295;
 Mon, 29 Mar 2021 14:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617029158;
 bh=XsXIs05h7gy+Ea2ErRWgem+xoInohwvoi2eY6ftjYkI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zc5Uy/Z/24x9CE5n/K/asmcTGhTju84F+TyNw+opF7zOJek3+0vsWko/rPck+Gy0S
 Ysdb7RbUGy1Fek4NX1bFiLs84BrJU70gxmMpwnaPh26F/7vCsFVmR8mmlAt6RbUmRf
 8ojAgHsMHOsEdBHfP0XYXRq0zFwF4aPFrZyuT8BE+amPZRmSqlldQ59UyDXTZZ50qD
 4QczE/xZ3BXKuSTcdNdoicMIuGWCdJxHLDqcDyNeon0bIyRziKxHsM381YHpgevKvF
 BXhqfdWI8LNzUnuP3piB7K9EEzhYukgxWniX4avzhSfXTDeJ7T6M3lXDv+rd3gsky3
 BI/3em0rOG1pw==
Date: Mon, 29 Mar 2021 15:45:54 +0100
From: Will Deacon <will@kernel.org>
To: chenxiang <chenxiang66@hisilicon.com>
Subject: Re: [PATCH] iommu: Add a check to avoid invalid iotlb sync
Message-ID: <20210329144554.GA4203@willie-the-truck>
References: <1616826190-77035-1-git-send-email-chenxiang66@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616826190-77035-1-git-send-email-chenxiang66@hisilicon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linux-foundation.org, robin.murphy@arm.com,
 linuxarm@openeuler.org
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

On Sat, Mar 27, 2021 at 02:23:10PM +0800, chenxiang wrote:
> From: Xiang Chen <chenxiang66@hisilicon.com>
> 
> Currently it will send a iotlb sync at end of iommu unmap even if
> iotlb_gather is not valid (iotlb_gather->pgsize = 0). Actually it is not
> necessary, so add a check to avoid invalid iotlb sync.
> 
> Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
> ---
>  include/linux/iommu.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 9ca6e6b..6afa61b 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -529,6 +529,9 @@ static inline void iommu_flush_iotlb_all(struct iommu_domain *domain)
>  static inline void iommu_iotlb_sync(struct iommu_domain *domain,
>  				  struct iommu_iotlb_gather *iotlb_gather)
>  {
> +	if (!iotlb_gather->pgsize)
> +		return;

In which circumstances does this occur?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
