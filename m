Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 407691ABB62
	for <lists.iommu@lfdr.de>; Thu, 16 Apr 2020 10:38:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id C0E47860D2;
	Thu, 16 Apr 2020 08:38:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uv7xZpg207Ax; Thu, 16 Apr 2020 08:38:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4C218860A2;
	Thu, 16 Apr 2020 08:38:27 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2F141C0172;
	Thu, 16 Apr 2020 08:38:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DD7B3C0172
 for <iommu@lists.linux-foundation.org>; Thu, 16 Apr 2020 08:38:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id CCC8A860D2
 for <iommu@lists.linux-foundation.org>; Thu, 16 Apr 2020 08:38:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LH-bE6m0C+Ng for <iommu@lists.linux-foundation.org>;
 Thu, 16 Apr 2020 08:38:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8DEA3860A2
 for <iommu@lists.linux-foundation.org>; Thu, 16 Apr 2020 08:38:23 +0000 (UTC)
IronPort-SDR: Wyo/QJ1NKsVKRGxbaTtnL1EbB2f3bj67rC08Ij6GUw6g4aDXuuU6rw8zgGWC+sNXW/okuR9KuQ
 pAV7BWoxcmRQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2020 01:38:22 -0700
IronPort-SDR: rdm/YyN9bcHeb9GkMPmye0GRmbe4rYsAjLnoGkIXuxjYDrG319KjtNuSgE3re9qKzAukkPKeqO
 HMYr5Dl8YcUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,390,1580803200"; d="scan'208";a="427756139"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.209.171])
 ([10.254.209.171])
 by orsmga005.jf.intel.com with ESMTP; 16 Apr 2020 01:38:20 -0700
Subject: Re: [PATCH v2 6/7] iommu/vt-d: Add page request draining support
To: "Tian, Kevin" <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>
References: <20200415052542.30421-1-baolu.lu@linux.intel.com>
 <20200415052542.30421-7-baolu.lu@linux.intel.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D8209CE@SHSMSX104.ccr.corp.intel.com>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <acf26559-49d2-653c-156d-3ef383b43879@linux.intel.com>
Date: Thu, 16 Apr 2020 16:38:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D8209CE@SHSMSX104.ccr.corp.intel.com>
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

On 2020/4/15 19:10, Tian, Kevin wrote:
> the completion of above sequence ensures that previous queued
> page group responses are sent out and received by the endpoint
> and vice versa all in-fly page requests from the endpoint are queued
> in iommu page request queue. Then comes a problem - you didn't
> wait for completion of those newly-queued requests and their
> responses.

I thought about this again.

We do page request draining after PASID table entry gets torn down and
the devTLB gets invalidated. At this point, if any new page request for
this pasid comes in, IOMMU will generate an unrecoverable fault and
response the device with IR (Invalid Request). IOMMU won't put this page
request into the queue. [VT-d spec 7.4.1]

Hence, we don't need to worry about the newly-queued requests here.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
