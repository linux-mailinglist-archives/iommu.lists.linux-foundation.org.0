Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 9173E1F5113
	for <lists.iommu@lfdr.de>; Wed, 10 Jun 2020 11:27:21 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 24E26220DD;
	Wed, 10 Jun 2020 09:27:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id utusEcLkCLxO; Wed, 10 Jun 2020 09:27:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4D65A22FB9;
	Wed, 10 Jun 2020 09:27:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 36792C016F;
	Wed, 10 Jun 2020 09:27:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 04837C016F
 for <iommu@lists.linux-foundation.org>; Wed, 10 Jun 2020 09:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id E607A86E93
 for <iommu@lists.linux-foundation.org>; Wed, 10 Jun 2020 09:27:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0vrWoeK6lTdN for <iommu@lists.linux-foundation.org>;
 Wed, 10 Jun 2020 09:27:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 680F886DB2
 for <iommu@lists.linux-foundation.org>; Wed, 10 Jun 2020 09:27:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1591781235; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=IpS6LvB59AAFg+uXb9gY9Ph2ttT1iEsbG4T4LlRTt9U=;
 b=tSV5v84a307kSk1Pal9CcH1h74svwWaf6n+wxkdmKNdo/r+7HxcDjpAyRtmx6H0pLWExjry6
 Mm2RmBFZ9hvrD4EvTZteX6pfchuZ5jx9sWE+iXnvgyEcmxJYUln0dxVjYfnB7GM8A2eMzg+v
 JMbJscCQtSFMLAMiYZOO2jlxeH8=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5ee0a765117610c7ffd37dd3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Jun 2020 09:27:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 70631C43391; Wed, 10 Jun 2020 09:27:01 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: guptap)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DD3D8C433CA;
 Wed, 10 Jun 2020 09:27:00 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 10 Jun 2020 14:57:00 +0530
From: guptap@codeaurora.org
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/iova: Don't BUG on invalid PFNs
In-Reply-To: <acbd2d092b42738a03a21b417ce64e27f8c91c86.1591103298.git.robin.murphy@arm.com>
References: <acbd2d092b42738a03a21b417ce64e27f8c91c86.1591103298.git.robin.murphy@arm.com>
Message-ID: <79df62c92cf61f2b5f717c28d620a283@codeaurora.org>
X-Sender: guptap@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Cc: iommu@lists.linux-foundation.org, stable@vger.kernel.org,
 linux-kernel@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On 2020-06-02 18:38, Robin Murphy wrote:
> Unlike the other instances which represent a complete loss of
> consistency within the rcache mechanism itself, or a fundamental
> and obvious misconfiguration by an IOMMU driver, the BUG_ON() in
> iova_magazine_free_pfns() can be provoked at more or less any time
> in a "spooky action-at-a-distance" manner by any old device driver
> passing nonsense to dma_unmap_*() which then propagates through to
> queue_iova().
> 
> Not only is this well outside the IOVA layer's control, it's also
> nowhere near fatal enough to justify panicking anyway - all that
> really achieves is to make debugging the offending driver more
> difficult. Let's simply WARN and otherwise ignore bogus PFNs.
> 
> Reported-by: Prakash Gupta <guptap@codeaurora.org>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/iova.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Copying stable@vger.kernel.org

You can add
Reviewed-by: Prakash Gupta <guptap@codeaurora.org>

> diff --git a/drivers/iommu/iova.c b/drivers/iommu/iova.c
> index 0e6a9536eca6..612cbf668adf 100644
> --- a/drivers/iommu/iova.c
> +++ b/drivers/iommu/iova.c
> @@ -811,7 +811,9 @@ iova_magazine_free_pfns(struct iova_magazine *mag,
> struct iova_domain *iovad)
>  	for (i = 0 ; i < mag->size; ++i) {
>  		struct iova *iova = private_find_iova(iovad, mag->pfns[i]);
> 
> -		BUG_ON(!iova);
> +		if (WARN_ON(!iova))
> +			continue;
> +
>  		private_free_iova(iovad, iova);
>  	}
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
