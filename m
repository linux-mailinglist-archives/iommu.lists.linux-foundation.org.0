Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE401BD05A
	for <lists.iommu@lfdr.de>; Wed, 29 Apr 2020 01:04:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A0CF122B25;
	Tue, 28 Apr 2020 23:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7-1VDJv-eHQi; Tue, 28 Apr 2020 23:04:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AD5C22291D;
	Tue, 28 Apr 2020 23:04:37 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8D19EC0172;
	Tue, 28 Apr 2020 23:04:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44FE5C0172;
 Tue, 28 Apr 2020 23:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 2B40D882E3;
 Tue, 28 Apr 2020 23:04:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bF3J5H4MF2ae; Tue, 28 Apr 2020 23:04:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B0A3A882C4;
 Tue, 28 Apr 2020 23:04:35 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E881120656;
 Tue, 28 Apr 2020 23:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588115075;
 bh=bo21LaVDiN3p5qRExTfq+J7LOaI4TxtlxHpokeU5a/o=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=yFtq8fVR/VOkhVWVlZwlZokdulMlFu18XJsQJY7pDxJcDZzrCvZYs0XLTYNZmxQFB
 TBC5AJbU1fcRxpBlV7gSsUZbbrInB3b/KP1iNNFQvhDadkU4ftnPdNkgd7QRwiGDNB
 fSoqdmY8NaFIDGsoCMkQHQ8Ab/XP58R2TcfoPOUo=
Date: Tue, 28 Apr 2020 16:04:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 5/5] virtio: Add bounce DMA ops
In-Reply-To: <20200428163448-mutt-send-email-mst@kernel.org>
Message-ID: <alpine.DEB.2.21.2004281556180.29217@sstabellini-ThinkPad-T480s>
References: <1588073958-1793-1-git-send-email-vatsa@codeaurora.org>
 <1588073958-1793-6-git-send-email-vatsa@codeaurora.org>
 <20200428121232-mutt-send-email-mst@kernel.org>
 <20200428174952.GA5097@quicinc.com>
 <20200428163448-mutt-send-email-mst@kernel.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: tsoni@codeaurora.org, virtio-dev@lists.oasis-open.org,
 konrad.wilk@oracle.com, jan.kiszka@siemens.com, jasowang@redhat.com,
 Srivatsa Vaddagiri <vatsa@codeaurora.org>, christoffer.dall@arm.com,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, 28 Apr 2020, Michael S. Tsirkin wrote:
> On Tue, Apr 28, 2020 at 11:19:52PM +0530, Srivatsa Vaddagiri wrote:
> > * Michael S. Tsirkin <mst@redhat.com> [2020-04-28 12:17:57]:
> > 
> > > Okay, but how is all this virtio specific?  For example, why not allow
> > > separate swiotlbs for any type of device?
> > > For example, this might make sense if a given device is from a
> > > different, less trusted vendor.
> > 
> > Is swiotlb commonly used for multiple devices that may be on different trust
> > boundaries (and not behind a hardware iommu)?

The trust boundary is not a good way of describing the scenario and I
think it leads to miscommunication.

A better way to describe the scenario would be that the device can only
DMA to/from a small reserved-memory region advertised on device tree.

Do we have other instances of devices that can only DMA to/from very
specific and non-configurable address ranges? If so, this series could
follow their example.


> Even a hardware iommu does not imply a 100% security from malicious
> hardware. First lots of people use iommu=pt for performance reasons.
> Second even without pt, unmaps are often batched, and sub-page buffers
> might be used for DMA, so we are not 100% protected at all times.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
