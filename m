Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD7256CD6B
	for <lists.iommu@lfdr.de>; Sun, 10 Jul 2022 08:37:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FA5E408B0;
	Sun, 10 Jul 2022 06:37:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FA5E408B0
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TZIBo1el
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5lnyf-nxCm0l; Sun, 10 Jul 2022 06:37:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id B244F40131;
	Sun, 10 Jul 2022 06:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B244F40131
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 68A27C008B;
	Sun, 10 Jul 2022 06:37:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6BF77C002D
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 10:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 374F240CD4
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 10:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 374F240CD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kOpmXCV4ikq0 for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jul 2022 10:03:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18BA740143
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18BA740143
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jul 2022 10:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657274603; x=1688810603;
 h=message-id:date:mime-version:cc:subject:to:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/AdO0rKnZoOTjmFHlRJizwAKtrbmVejA2F0DibLdYO8=;
 b=TZIBo1elBrPMziEAiD9+h/Fjy6PkriqIte2ESFZ4vC6KCkesZqGyByQk
 VvKXZZmfNdPRgHPFwjOK9r1JB50klCDMkBe0gyOh1jI9iYBtRZ8gPOblw
 kgVEU+YZIyZN4cooaSkO8XUl0NwepRYFYmvPriUmYkOkwFwhxPbXtbTWa
 Bn5PAFW2HfKkr6KMGAa+3hGE26kZLC/iiEUyvUObnYeSUXo5Lw4An0BTT
 mwkxKWre64ylPjdNRZoxxcwQBsvUnCzfLaWs0IwkempZxT4QBmJRAd4C4
 /ybvjKYWyifpT78LZg4cPXx4jzKLHH8k6OAA71s7B99oX1adoZDjjdAe5 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="348231582"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="348231582"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 03:03:21 -0700
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="621161995"
Received: from yanc1-mobl.ccr.corp.intel.com (HELO [10.255.28.91])
 ([10.255.28.91])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 03:03:19 -0700
Message-ID: <c60b5128-e178-77bc-2cde-a1c25899094a@linux.intel.com>
Date: Fri, 8 Jul 2022 18:03:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/4] iommu: remove the put_resv_regions method
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
References: <20220708080616.238833-1-hch@lst.de>
 <20220708080616.238833-4-hch@lst.de>
 <9e3264ff-c94e-db77-9a29-2d6fd2585c9e@linux.intel.com>
 <20220708093332.GA28988@lst.de>
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20220708093332.GA28988@lst.de>
X-Mailman-Approved-At: Sun, 10 Jul 2022 06:37:28 +0000
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 David Woodhouse <dwmw2@infradead.org>, Robin Murphy <robin.murphy@arm.com>,
 iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 Will Deacon <will@kernel.org>
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

On 2022/7/8 17:33, Christoph Hellwig wrote:
> On Fri, Jul 08, 2022 at 05:00:59PM +0800, Baolu Lu wrote:
>> Do we really need to export this symbol? It is not used beyond the iommu
>> core code.
> 
> virtio-iommu calls it and can be modular.

Yes. Thanks for the explanation.

Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
