Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id C781F4A4B00
	for <lists.iommu@lfdr.de>; Mon, 31 Jan 2022 16:52:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CCC682B24;
	Mon, 31 Jan 2022 15:52:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ahE9DfHnJZuH; Mon, 31 Jan 2022 15:52:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id B24AD82B3E;
	Mon, 31 Jan 2022 15:52:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 905D0C000B;
	Mon, 31 Jan 2022 15:52:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4E124C000B
 for <iommu@lists.linux-foundation.org>; Mon, 31 Jan 2022 15:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4668C82B24
 for <iommu@lists.linux-foundation.org>; Mon, 31 Jan 2022 15:52:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pCvgpfiEBX0G for <iommu@lists.linux-foundation.org>;
 Mon, 31 Jan 2022 15:52:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2001833AF
 for <iommu@lists.linux-foundation.org>; Mon, 31 Jan 2022 15:52:13 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id D94A74DC; Mon, 31 Jan 2022 16:52:11 +0100 (CET)
Date: Mon, 31 Jan 2022 16:52:10 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 1/2] iommu/vt-d: Fix PCI bus rescan device hot add
Message-ID: <YfgFqp+lR9wRdUWn@8bytes.org>
References: <20220128031002.2219155-1-baolu.lu@linux.intel.com>
 <20220128031002.2219155-2-baolu.lu@linux.intel.com>
 <YfZBlzYTN/RfCGnE@8bytes.org>
 <d9c35bb7-e6f5-a439-505b-5352c34f5621@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d9c35bb7-e6f5-a439-505b-5352c34f5621@arm.com>
Cc: iommu@lists.linux-foundation.org, Zhang@8bytes.org,
 Guoqing Jiang <guoqing.jiang@linux.dev>, Bernice <bernice.zhang@intel.com>
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

On Mon, Jan 31, 2022 at 01:53:06PM +0000, Robin Murphy wrote:
> Indeed I very nearly asked whether we couldn't just call these from
> intel_iommu_{probe,release}_device() directly, but it looks like they also
> interact with the interrupt remapping stuff which can be built independently
> of the IOMMU API :(

Okay, but having two notifiers is still ugly. Can we only register a
notifier when IRQ-remapping is used without IOMMU-API? In this case a
single notifier be sufficient.

Regards,

Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
