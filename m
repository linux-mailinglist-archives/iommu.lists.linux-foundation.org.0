Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B371C82D2
	for <lists.iommu@lfdr.de>; Thu,  7 May 2020 08:47:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AF7E987EEE;
	Thu,  7 May 2020 06:47:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jNtOqy9UOpyI; Thu,  7 May 2020 06:47:48 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4FB6487FF2;
	Thu,  7 May 2020 06:47:48 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 33431C0890;
	Thu,  7 May 2020 06:47:48 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EC57EC07FF
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 06:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D40D088865
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 06:47:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3QaldZgEW2Be for <iommu@lists.linux-foundation.org>;
 Thu,  7 May 2020 06:47:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4AEE58885F
 for <iommu@lists.linux-foundation.org>; Thu,  7 May 2020 06:47:45 +0000 (UTC)
IronPort-SDR: zFrpdPAN4GxWJopKw/tiIWGhmHuaJ99F8u5OwYU3y+hAJJefnBfxhQN9OF/oGK03CmDiEMQt7/
 fondz4hRlLgw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 23:47:44 -0700
IronPort-SDR: 5pgQX32zHuoaoJHS0ypm2zrWQM8pnclLJQUVs6cFKCishwiQrOTaJJ+NBWZHQnrRUCq8v9KmQl
 AXNNhZ/1Fliw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,362,1583222400"; d="scan'208";a="260429256"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.249.169.187])
 ([10.249.169.187])
 by orsmga003.jf.intel.com with ESMTP; 06 May 2020 23:47:42 -0700
Subject: Re: [PATCH v4 0/5] iommu/vt-d: Add page request draining support
To: "Tian, Kevin" <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>
References: <20200507005534.3080-1-baolu.lu@linux.intel.com>
 <MWHPR11MB16452D6184F192F6B10784EE8CA50@MWHPR11MB1645.namprd11.prod.outlook.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <a6b404ef-4a0d-7ad3-2e20-91060e5374c0@linux.intel.com>
Date: Thu, 7 May 2020 14:47:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <MWHPR11MB16452D6184F192F6B10784EE8CA50@MWHPR11MB1645.namprd11.prod.outlook.com>
Content-Language: en-US
Cc: "Raj, Ashok" <ashok.raj@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
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

Hi Kevin,

Thanks a lot for reviewing.

On 2020/5/7 14:38, Tian, Kevin wrote:
>> From: Lu Baolu<baolu.lu@linux.intel.com>
>> Sent: Thursday, May 7, 2020 8:55 AM
>>
>> When a PASID is stopped or terminated, there can be pending PRQs
>> (requests that haven't received responses) in the software and
>> remapping hardware. The pending page requests must be drained
>> so that the pasid could be reused. The chapter 7.10 in the VT-d
>> specification specifies the software steps to drain pending page
>> requests and responses.
>>
>> This includes two parts:
>>   - PATCH 1/4 ~ 2/4: refactor the qi_submit_sync() to support multiple
>>     descriptors per submission which will be used in the following
>>     patch.
>>   - PATCH 3/4 ~ 4/4: add page request drain support after a pasid entry
>>     is torn down.
>>
> I think you should mention that this series depends on Jacob's nested
> SVA series.
> 

Yes. It's based on Jacob's vSVA series since guest unbind also requires
prq draining.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
