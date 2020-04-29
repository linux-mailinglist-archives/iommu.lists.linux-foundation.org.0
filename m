Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id F13D41BD236
	for <lists.iommu@lfdr.de>; Wed, 29 Apr 2020 04:22:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6B45087487;
	Wed, 29 Apr 2020 02:22:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZDiOhPYHsfiQ; Wed, 29 Apr 2020 02:22:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 798B1873B8;
	Wed, 29 Apr 2020 02:22:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5E8B5C0172;
	Wed, 29 Apr 2020 02:22:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 89844C0172;
 Wed, 29 Apr 2020 02:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 71F9E880C7;
 Wed, 29 Apr 2020 02:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1rpZUJxGp9pF; Wed, 29 Apr 2020 02:22:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by hemlock.osuosl.org (Postfix) with ESMTPS id CA127880C2;
 Wed, 29 Apr 2020 02:22:37 +0000 (UTC)
IronPort-SDR: 0UwEd7ABne9hYI+iI+3FSazckRpGkGkn219VEuSviDsJDSvSrNIBMYWwWv2H6xyTwjmrx/My7y
 LRWmfbqzcpOw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2020 19:22:37 -0700
IronPort-SDR: t/qSzNPhjbSFSg3fCjJzj3YTdCvW1TlKbhSmmEST7wnCHVJo0xkfWM5OPrCfhuevcOufHCdsZv
 3ikcNbOtcXfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,329,1583222400"; d="scan'208";a="246698532"
Received: from blu2-mobl3.ccr.corp.intel.com (HELO [10.254.208.67])
 ([10.254.208.67])
 by orsmga007.jf.intel.com with ESMTP; 28 Apr 2020 19:22:33 -0700
Subject: Re: [PATCH 5/5] virtio: Add bounce DMA ops
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Srivatsa Vaddagiri <vatsa@codeaurora.org>
References: <1588073958-1793-1-git-send-email-vatsa@codeaurora.org>
 <1588073958-1793-6-git-send-email-vatsa@codeaurora.org>
 <20200428121232-mutt-send-email-mst@kernel.org>
 <20200428174952.GA5097@quicinc.com>
 <20200428163448-mutt-send-email-mst@kernel.org>
From: Lu Baolu <baolu.lu@linux.intel.com>
Message-ID: <275eba4b-dd35-aa95-b2e3-9c5cbf7c6d71@linux.intel.com>
Date: Wed, 29 Apr 2020 10:22:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200428163448-mutt-send-email-mst@kernel.org>
Content-Language: en-US
Cc: tsoni@codeaurora.org, virtio-dev@lists.oasis-open.org, will@kernel.org,
 konrad.wilk@oracle.com, jan.kiszka@siemens.com, jasowang@redhat.com,
 christoffer.dall@arm.com, pratikp@codeaurora.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 stefano.stabellini@xilinx.com, alex.bennee@linaro.org,
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

On 2020/4/29 4:41, Michael S. Tsirkin wrote:
> On Tue, Apr 28, 2020 at 11:19:52PM +0530, Srivatsa Vaddagiri wrote:
>> * Michael S. Tsirkin<mst@redhat.com>  [2020-04-28 12:17:57]:
>>
>>> Okay, but how is all this virtio specific?  For example, why not allow
>>> separate swiotlbs for any type of device?
>>> For example, this might make sense if a given device is from a
>>> different, less trusted vendor.
>> Is swiotlb commonly used for multiple devices that may be on different trust
>> boundaries (and not behind a hardware iommu)?
> Even a hardware iommu does not imply a 100% security from malicious
> hardware. First lots of people use iommu=pt for performance reasons.
> Second even without pt, unmaps are often batched, and sub-page buffers
> might be used for DMA, so we are not 100% protected at all times.
> 

For untrusted devices, IOMMU is forced on even iommu=pt is used; and
iotlb flush is in strict mode (no batched flushes); ATS is also not
allowed. Swiotlb is used to protect sub-page buffers since IOMMU can
only apply page granularity protection. Swiotlb is now used for devices
from different trust zone.

Best regards,
baolu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
