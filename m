Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9751E54A9
	for <lists.iommu@lfdr.de>; Thu, 28 May 2020 05:33:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0EF2487E75;
	Thu, 28 May 2020 03:33:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yb1k7ele1eEg; Thu, 28 May 2020 03:32:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9277288000;
	Thu, 28 May 2020 03:32:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 58E7CC016F;
	Thu, 28 May 2020 03:32:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1FD4AC016F
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 03:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0317687CE5
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 03:32:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zPQ2q22NS6AN for <iommu@lists.linux-foundation.org>;
 Thu, 28 May 2020 03:32:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7B21587CB8
 for <iommu@lists.linux-foundation.org>; Thu, 28 May 2020 03:32:54 +0000 (UTC)
IronPort-SDR: vLxwiC2L+9oKwFp6q+MJglDowKa9MPG87loUN9DViiTRp8TI1BsdFARo7kRedXbH98CG62Qq8v
 bHpjtw3eRUOg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 20:32:53 -0700
IronPort-SDR: aMrmb/yjh74ERnosBMv5m8Ek7SdL3S/QXiC2IrgR9v5japACP9TGsJl5uu2zrLXi8bXnm+/qlX
 Ph/lx4/GAlqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,443,1583222400"; d="scan'208";a="345767945"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.255.30.232])
 ([10.255.30.232])
 by orsmga001.jf.intel.com with ESMTP; 27 May 2020 20:32:51 -0700
Subject: Re: [PATCH v2 0/2] iommu: Remove iommu_sva_ops::mm_exit()
To: Joerg Roedel <joro@8bytes.org>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 "jacob.jun.pan@linux.intel.com" <jacob.jun.pan@linux.intel.com>
References: <20200423125329.782066-1-jean-philippe@linaro.org>
 <20200527101038.GD265288@myrica> <20200527124240.GK5221@8bytes.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <00f0597f-b235-b92e-ad41-a7ffcff9b59b@linux.intel.com>
Date: Thu, 28 May 2020 11:32:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200527124240.GK5221@8bytes.org>
Content-Language: en-US
Cc: arnd@arndb.de, gregkh@linuxfoundation.org, jgg@ziepe.ca,
 iommu@lists.linux-foundation.org, zhangfei.gao@linaro.org,
 linux-accelerators@lists.ozlabs.org
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

Hi Jorge,

On 2020/5/27 20:42, Joerg Roedel wrote:
> Hi Jean-Philippe,
> 
> On Wed, May 27, 2020 at 12:10:38PM +0200, Jean-Philippe Brucker wrote:
>> I was wondering if you could take these two patches for v5.8. The API
>> change is a precursor for the SVA support in SMMUv3, and the VT-d
>> implementation of the SVA API (queued for 5.8) doesn't implement
>> iommu_sva_ops.
> 
> I'd like some Acks on patch 2 (at least from the Intel people) before
> going ahead with this.
> 

Patch 2 in this series looks good to me.

Acked-by: Lu Baolu <baolu.lu@linux.intel.com>

+Jacob, he participated in the discussions.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
