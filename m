Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 74880104577
	for <lists.iommu@lfdr.de>; Wed, 20 Nov 2019 22:02:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2B5B58699B;
	Wed, 20 Nov 2019 21:02:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iB_CCan80gUn; Wed, 20 Nov 2019 21:02:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 53831869D7;
	Wed, 20 Nov 2019 21:02:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E868C18DA;
	Wed, 20 Nov 2019 21:02:17 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3E726C18DA
 for <iommu@lists.linux-foundation.org>; Wed, 20 Nov 2019 21:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 39AB92000D
 for <iommu@lists.linux-foundation.org>; Wed, 20 Nov 2019 21:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DB8fO2zFSjNO for <iommu@lists.linux-foundation.org>;
 Wed, 20 Nov 2019 21:02:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by silver.osuosl.org (Postfix) with ESMTPS id 36ACB1FE49
 for <iommu@lists.linux-foundation.org>; Wed, 20 Nov 2019 21:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1574283732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GOrvXvluHE3iSsyI4T3cknsOlbzrHrOQA3zBzSTxvuA=;
 b=I5o8ET4sDzMZo0HpaPkEItFtbbQK8jRfKunaEvEXEm0IQANbRrbzwpdniEgG84+Zg0aYoW
 JA/0cBa3daF5gy93zEUB1Oj1M4Y8sHNpxBTxfhz+PwywfRxdgHkCmzRHemjHMo8TPkHHZS
 2yqrYDLGTzk9MSYLoekrT9fIVYCepLU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-ab41IDNWMgG7HyiGvFLoKw-1; Wed, 20 Nov 2019 16:02:09 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BC7118C35A8;
 Wed, 20 Nov 2019 21:02:07 +0000 (UTC)
Received: from [10.36.116.37] (ovpn-116-37.ams2.redhat.com [10.36.116.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E25166D4E;
 Wed, 20 Nov 2019 21:02:04 +0000 (UTC)
Subject: Re: [PATCH v3 5/8] iommu/vt-d: Fix off-by-one in PASID allocation
To: Jacob Pan <jacob.jun.pan@linux.intel.com>,
 iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Lu Baolu <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>
References: <1574186193-30457-1-git-send-email-jacob.jun.pan@linux.intel.com>
 <1574186193-30457-6-git-send-email-jacob.jun.pan@linux.intel.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <ac6270f0-3283-2473-267a-cea9b68a0296@redhat.com>
Date: Wed, 20 Nov 2019 22:02:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1574186193-30457-6-git-send-email-jacob.jun.pan@linux.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: ab41IDNWMgG7HyiGvFLoKw-1
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

Hi

On 11/19/19 6:56 PM, Jacob Pan wrote:
> PASID allocator uses IDR which is exclusive for the end of the
> allocation range. There is no need to decrement pasid_max.
> 
> Fixes: af39507305fb ("iommu/vt-d: Apply global PASID in SVA")
> Reported-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
> Acked-by: Lu Baolu <baolu.lu@linux.intel.com>
same (v2)
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  drivers/iommu/intel-svm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/intel-svm.c b/drivers/iommu/intel-svm.c
> index 74df10a39dfc..e90d0b914afe 100644
> --- a/drivers/iommu/intel-svm.c
> +++ b/drivers/iommu/intel-svm.c
> @@ -338,7 +338,7 @@ int intel_svm_bind_mm(struct device *dev, int *pasid, int flags, struct svm_dev_
>  		/* Do not use PASID 0 in caching mode (virtualised IOMMU) */
>  		ret = intel_pasid_alloc_id(svm,
>  					   !!cap_caching_mode(iommu->cap),
> -					   pasid_max - 1, GFP_KERNEL);
> +					   pasid_max, GFP_KERNEL);
>  		if (ret < 0) {
>  			kfree(svm);
>  			kfree(sdev);
> 

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
