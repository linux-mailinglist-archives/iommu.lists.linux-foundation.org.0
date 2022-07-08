Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBB256CD67
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBC8A40608;
	Sun, 10 Jul 2022 06:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBC8A40608
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=btJaQUTJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KX-u7zvTbFlt; Sun, 10 Jul 2022 06:37:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 041C3405E3;
	Sun, 10 Jul 2022 06:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 041C3405E3
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id ED071C007E;
	Sun, 10 Jul 2022 06:37:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C314EC002D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 09:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92AA44250A
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 09:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92AA44250A
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.a=rsa-sha256 header.s=Intel header.b=btJaQUTJ
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RnwGdLZkz5U1 for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jul 2022 09:01:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3D7442521
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3D7442521
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 09:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657270864; x=1688806864;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gZP4ji5dC3Yf9tdKK+6CvB7hwlnP7y96GIxHCmC9kNo=;
 b=btJaQUTJIuejpPRPtlcdiedDpmZNTU2G9tDLGyZy6lMNIRyutRJR39UQ
 qbtspiTatbqzGITNl8V3B0/awo7xONxEVSfograVZp++tXRyRwp9zV84q
 YFiB5diB7/7E3gNAfbzllqRLzLBjqSr/NhcRJjhFP9wSin1CLT66WShMi
 8QrwQhcPxqOO2bLYBCevChVssSWjCTsHk+L/JalzsSh+j/hbQb7B6UGnW
 Pz/oTXmPXGgfc5vyM2vglQMeypCyoX7N1/cSzRcnIvJxAcUm7qHYi1ycD
 XcjdMHQWOu+Rszp2qfmVd5awYWAlX5igz/nnAeNA1INYkx4CE+Rroj/wI Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="281785532"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="281785532"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 02:01:03 -0700
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="621144593"
Received: from yanc1-mobl.ccr.corp.intel.com (HELO [10.255.28.91])
 ([10.255.28.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 02:01:00 -0700
Message-ID: <9e3264ff-c94e-db77-9a29-2d6fd2585c9e@linux.intel.com>
Date: Fri, 8 Jul 2022 17:00:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/4] iommu: remove the put_resv_regions method
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Joerg Roedel <joro@8bytes.org>,
 Sven Peter <sven@svenpeter.dev>, David Woodhouse <dwmw2@infradead.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Yong Wu <yong.wu@mediatek.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20220708080616.238833-1-hch@lst.de>
 <20220708080616.238833-4-hch@lst.de>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20220708080616.238833-4-hch@lst.de>
X-Mailman-Approved-At: Sun, 10 Jul 2022 06:37:28 +0000
Cc: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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

On 2022/7/8 16:06, Christoph Hellwig wrote:
> -void generic_iommu_put_resv_regions(struct device *dev, struct list_head *list)
> +void iommu_put_resv_regions(struct device *dev, struct list_head *list)
>   {
>   	struct iommu_resv_region *entry, *next;
>   
> @@ -2610,7 +2597,7 @@ void generic_iommu_put_resv_regions(struct device *dev, struct list_head *list)
>   			kfree(entry);
>   	}
>   }
> -EXPORT_SYMBOL(generic_iommu_put_resv_regions);
> +EXPORT_SYMBOL(iommu_put_resv_regions);

Do we really need to export this symbol? It is not used beyond the iommu
core code.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
