Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A554F1053
	for <lists.iommu@lfdr.de>; Mon,  4 Apr 2022 09:52:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 920A841583;
	Mon,  4 Apr 2022 07:52:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dAqTLCzwdkyT; Mon,  4 Apr 2022 07:52:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 557F84152D;
	Mon,  4 Apr 2022 07:52:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 25B60C0082;
	Mon,  4 Apr 2022 07:52:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A90D6C0012
 for <iommu@lists.linux-foundation.org>; Mon,  4 Apr 2022 07:52:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 80A984152D
 for <iommu@lists.linux-foundation.org>; Mon,  4 Apr 2022 07:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RDhbkabxNP2n for <iommu@lists.linux-foundation.org>;
 Mon,  4 Apr 2022 07:52:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 248FC4152B
 for <iommu@lists.linux-foundation.org>; Mon,  4 Apr 2022 07:52:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: usama.anjum) with ESMTPSA id 1F4991F4575C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649058742;
 bh=x1VinAdRPQoJHVNstNlVveO35hxb/5sR/7Ny5l1p3Io=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=YiqEhEg4ssGOtrMDM05KkO9AYvGHSfr+IfVaO7eW50S1b4fkapRZG/g2dNIVuE/hi
 8OjIL3g0Y5wacFey5CTKRa/mrZQO5CAF5acnk0Jh4L75ItU5Rtcsphcf5I91vzOh3d
 cBHqra39gdUTmmYTTGXwKLlGFnkMZ3kXBxskE6UTYa6PG+rmOcWzc50bTRp8nBoqCk
 IizeJwCcvWSUD54d51doHzfetq3k6zi/j6hEr8myGxMTRtNOxmb99my1MxltLBeiIS
 nlcmxO4WsRBU8C+PlUf/PEaODQ4NkQ73miBR8qDj20men7zHkvtxzcLpWNyHnjgN6v
 XGUDxOXfR2tiw==
Message-ID: <ace47a96-4e43-697a-4cfe-04544f014940@collabora.com>
Date: Mon, 4 Apr 2022 12:52:15 +0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] iommu/vt-d: remove unneeded validity check on dev
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, Lu Baolu
 <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
References: <20220313150337.593650-1-usama.anjum@collabora.com>
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <20220313150337.593650-1-usama.anjum@collabora.com>
Cc: iommu@lists.linux-foundation.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org, usama.anjum@collabora.com
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

Any thoughts?

On 3/13/22 8:03 PM, Muhammad Usama Anjum wrote:
> dev_iommu_priv_get() is being used at the top of this function which
> dereferences dev. Dev cannot be NULL after this. Remove the validity
> check on dev and simplify the code.
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>  drivers/iommu/intel/iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/intel/iommu.c b/drivers/iommu/intel/iommu.c
> index df5c62ecf942b..f79edbbd651a4 100644
> --- a/drivers/iommu/intel/iommu.c
> +++ b/drivers/iommu/intel/iommu.c
> @@ -2502,7 +2502,7 @@ static struct dmar_domain *dmar_insert_one_dev_info(struct intel_iommu *iommu,
>  		}
>  	}
>  
> -	if (dev && domain_context_mapping(domain, dev)) {
> +	if (domain_context_mapping(domain, dev)) {
>  		dev_err(dev, "Domain context map failed\n");
>  		dmar_remove_one_dev_info(dev);
>  		return NULL;

-- 
Muhammad Usama Anjum
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
