Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6D5104583
	for <lists.iommu@lfdr.de>; Wed, 20 Nov 2019 22:08:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 7E7401FEAB;
	Wed, 20 Nov 2019 21:08:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6A1aAUMA4uOc; Wed, 20 Nov 2019 21:08:53 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 663FA20034;
	Wed, 20 Nov 2019 21:08:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6189DC1DDC;
	Wed, 20 Nov 2019 21:08:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25E75C18DA
 for <iommu@lists.linux-foundation.org>; Wed, 20 Nov 2019 21:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 20FE1853D3
 for <iommu@lists.linux-foundation.org>; Wed, 20 Nov 2019 21:08:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NdtYBhwag19i for <iommu@lists.linux-foundation.org>;
 Wed, 20 Nov 2019 21:08:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 66F97853C3
 for <iommu@lists.linux-foundation.org>; Wed, 20 Nov 2019 21:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574284130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IJ75uiFKE/vrS49xMrG/E26ErD3qo0pj2vUxc1owOuY=;
 b=TP2GzgspwdH3x07hAIbhxSXG0fMbCAfwzjxpEmydkxTm1NfTc9tIRCGu8YI2D2k+AwRHib
 g2JWrKY0xAXkDp0Vx80AN0S6fp2l3fN1+u7fqQFCtQ5FNask0zSFwMrN9d9J0eLVem1rNS
 eNNx8exwYMe2cJDqgjff9auEI3BPIcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-FfsjWtENNTS3u6KdzdVaig-1; Wed, 20 Nov 2019 16:08:46 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A630BDB22;
 Wed, 20 Nov 2019 21:08:44 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBA00348A2;
 Wed, 20 Nov 2019 21:08:41 +0000 (UTC)
Subject: Re: [PATCH v3 2/8] iommu/vt-d: Match CPU and IOMMU paging mode
To: Jacob Pan <jacob.jun.pan@linux.intel.com>,
 iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <1574186193-30457-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1574186193-30457-3-git-send-email-jacob.jun.pan@linux.intel.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <c77782e3-fafa-6397-94e0-e0be8572acd3@redhat.com>
Date: Wed, 20 Nov 2019 22:08:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1574186193-30457-3-git-send-email-jacob.jun.pan@linux.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: FfsjWtENNTS3u6KdzdVaig-1
X-Mimecast-Spam-Score: 0
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>
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

Hi Jacob,
On 11/19/19 6:56 PM, Jacob Pan wrote:
> When setting up first level page tables for sharing with CPU, we need
> to ensure IOMMU can support no less than the levels supported by the
> CPU.
> 
> It is not adequate, as in the current code, to set up 5-level paging
> in PASID entry First Level Paging Mode(FLPM) solely based on CPU.
> 
> Currently, intel_pasid_setup_first_level() is only used by native SVM
> code which already checks paging mode matches. However, future use of
> this helper function may not be limited to native SVM.
> https://lkml.org/lkml/2019/11/18/1037
> 
> Fixes: 437f35e1cd4c8 ("iommu/vt-d: Add first level page table
> interface")
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Acked-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  drivers/iommu/intel-pasid.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/intel-pasid.c b/drivers/iommu/intel-pasid.c
> index 040a445be300..e7cb0b8a7332 100644
> --- a/drivers/iommu/intel-pasid.c
> +++ b/drivers/iommu/intel-pasid.c
> @@ -499,8 +499,16 @@ int intel_pasid_setup_first_level(struct intel_iommu *iommu,
>  	}
>  
>  #ifdef CONFIG_X86
> -	if (cpu_feature_enabled(X86_FEATURE_LA57))
> -		pasid_set_flpm(pte, 1);
> +	/* Both CPU and IOMMU paging mode need to match */
> +	if (cpu_feature_enabled(X86_FEATURE_LA57)) {
> +		if (cap_5lp_support(iommu->cap)) {
> +			pasid_set_flpm(pte, 1);
> +		} else {
> +			pr_err("VT-d has no 5-level paging support for CPU\n");
> +			pasid_clear_entry(pte);
> +			return -EINVAL;
> +		}
> +	}
>  #endif /* CONFIG_X86 */
>  
>  	pasid_set_domain_id(pte, did);
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
