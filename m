Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6491BD36E
	for <lists.iommu@lfdr.de>; Wed, 29 Apr 2020 06:10:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 6D67F876C3;
	Wed, 29 Apr 2020 04:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OJKOVL5t1AmS; Wed, 29 Apr 2020 04:09:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B485084FA4;
	Wed, 29 Apr 2020 04:09:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A12D5C0172;
	Wed, 29 Apr 2020 04:09:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3A233C0172
 for <iommu@lists.linux-foundation.org>; Wed, 29 Apr 2020 04:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 096DD22B7A
 for <iommu@lists.linux-foundation.org>; Wed, 29 Apr 2020 04:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id phsyuSiUdZtu for <iommu@lists.linux-foundation.org>;
 Wed, 29 Apr 2020 04:09:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by silver.osuosl.org (Postfix) with ESMTPS id 6035C22728
 for <iommu@lists.linux-foundation.org>; Wed, 29 Apr 2020 04:09:53 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1588133396; h=In-Reply-To: Content-Type: MIME-Version:
 References: Reply-To: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=ZygyuDR/+QYBGGocHbLP5ReISc55KGqtsbV+9Eyjzc4=;
 b=G26h1cf96gHSDfU3BKwonyYM3ljKyCGCAPnekgJz6PQ//93afP+/xrxhPY3RV+xKHP2Y1m4v
 arNhQx3dwGLg6jGhk9FAJ/+fkJHuo/AGLsM+AgLKx9PdYzXp6BaXNpIX9THEPns5MRygld5B
 fIWvBil7fc3ledD5y2MdrA6Pivk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3NDkwMCIsICJpb21tdUBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea8fe02.7f9da8115d88-smtp-out-n02;
 Wed, 29 Apr 2020 04:09:38 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5E364C4478C; Wed, 29 Apr 2020 04:09:37 +0000 (UTC)
Received: from quicinc.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: svaddagi)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5AB9AC433CB;
 Wed, 29 Apr 2020 04:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5AB9AC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=vatsa@codeaurora.org
Date: Wed, 29 Apr 2020 09:39:29 +0530
From: Srivatsa Vaddagiri <vatsa@codeaurora.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 5/5] virtio: Add bounce DMA ops
Message-ID: <20200429040929.GC5097@quicinc.com>
References: <1588073958-1793-1-git-send-email-vatsa@codeaurora.org>
 <1588073958-1793-6-git-send-email-vatsa@codeaurora.org>
 <20200428121232-mutt-send-email-mst@kernel.org>
 <20200428174952.GA5097@quicinc.com>
 <20200428163448-mutt-send-email-mst@kernel.org>
 <alpine.DEB.2.21.2004281556180.29217@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2004281556180.29217@sstabellini-ThinkPad-T480s>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: tsoni@codeaurora.org, virtio-dev@lists.oasis-open.org,
 konrad.wilk@oracle.com, jan.kiszka@siemens.com, jasowang@redhat.com,
 "Michael S. Tsirkin" <mst@redhat.com>, christoffer.dall@arm.com,
 virtualization@lists.linux-foundation.org, alex.bennee@linaro.org,
 iommu@lists.linux-foundation.org, stefano.stabellini@xilinx.com,
 will@kernel.org, linux-kernel@vger.kernel.org, pratikp@codeaurora.org
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
Reply-To: Srivatsa Vaddagiri <vatsa@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

* Stefano Stabellini <sstabellini@kernel.org> [2020-04-28 16:04:34]:

> > > Is swiotlb commonly used for multiple devices that may be on different trust
> > > boundaries (and not behind a hardware iommu)?
> 
> The trust boundary is not a good way of describing the scenario and I
> think it leads to miscommunication.
> 
> A better way to describe the scenario would be that the device can only
> DMA to/from a small reserved-memory region advertised on device tree.
> 
> Do we have other instances of devices that can only DMA to/from very
> specific and non-configurable address ranges? If so, this series could
> follow their example.

AFAICT there is no such notion in current DMA API.

static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size,
                bool is_ram)
{
        return end <= min_not_zero(*dev->dma_mask, dev->bus_dma_limit);
}

Only the max address a device can access is defined and not a range that we seem
to need here. I think we need to set the bus_dma_limit to 0 for virtio devices
which will force the use of swiotlb_map API. We should also have a per-device
swiotlb pool defined, so that swiotlb can use the pool meant for the given
device.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
