Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 818F71A964C
	for <lists.iommu@lfdr.de>; Wed, 15 Apr 2020 10:26:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3F9E686D7A;
	Wed, 15 Apr 2020 08:26:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5LVIqHF3twbi; Wed, 15 Apr 2020 08:26:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B72BB86B94;
	Wed, 15 Apr 2020 08:26:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A6502C0172;
	Wed, 15 Apr 2020 08:26:01 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 772CBC0172
 for <iommu@lists.linux-foundation.org>; Wed, 15 Apr 2020 08:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6059B85F8A
 for <iommu@lists.linux-foundation.org>; Wed, 15 Apr 2020 08:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G4qT2HRLo6Qm for <iommu@lists.linux-foundation.org>;
 Wed, 15 Apr 2020 08:26:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E090F85F83
 for <iommu@lists.linux-foundation.org>; Wed, 15 Apr 2020 08:25:59 +0000 (UTC)
IronPort-SDR: 12444Z3zgkVj9XiJPLszxw5i1BfVFd00jLu1ga1PsjBNG5arzoPbT7mOLFdGwj6woNsAwVrw32
 GUhXOPglQFMg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 01:25:59 -0700
IronPort-SDR: 5a7UZZIm9TvTEGcNrZpZNtTbbut9jtRf7FLh9wLYQDttWAjWNSQ/q8K/7MTU+gkqrgGdeQptB9
 nTV5e999iZHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; d="scan'208";a="363611763"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.210.208])
 ([10.254.210.208])
 by fmsmga001.fm.intel.com with ESMTP; 15 Apr 2020 01:25:57 -0700
Subject: Re: [PATCH v2 0/7] iommu/vt-d: Add page request draining support
To: "Tian, Kevin" <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>
References: <20200415052542.30421-1-baolu.lu@linux.intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D820475@SHSMSX104.ccr.corp.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <86b04dae-ff11-fc4b-551a-17c0ce352843@linux.intel.com>
Date: Wed, 15 Apr 2020 16:25:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D820475@SHSMSX104.ccr.corp.intel.com>
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

On 2020/4/15 15:57, Tian, Kevin wrote:
>> From: Lu Baolu<baolu.lu@linux.intel.com>
>> Sent: Wednesday, April 15, 2020 1:26 PM
>>
>> When a PASID is stopped or terminated, there can be pending PRQs
>> (requests that haven't received responses) in the software and
>> remapping hardware. The pending page requests must be drained
>> so that the pasid could be reused. The register level interface
>> for page request draining is defined in 7.11 of the VT-d spec.
>> This series adds the support for page requests draining.
> 7.11 doesn't include register-level interface. It just talks about
> the general requirements on system software, endpoint device
> and its driver.
> 

I will replace this with "spec 7.10 specifies the software steps to
drain page requests and response".

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
