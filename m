Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD06554A62
	for <lists.iommu@lfdr.de>; Wed, 22 Jun 2022 14:59:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C13D41837;
	Wed, 22 Jun 2022 12:59:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C13D41837
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4EDYMcMtK10U; Wed, 22 Jun 2022 12:59:25 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 016CF41C94;
	Wed, 22 Jun 2022 12:59:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 016CF41C94
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE4E3C0081;
	Wed, 22 Jun 2022 12:59:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 48DB5C002D
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 12:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D07360E85
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 12:59:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D07360E85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uSMDFko1Q0kh for <iommu@lists.linux-foundation.org>;
 Wed, 22 Jun 2022 12:59:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6087660E80
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6087660E80
 for <iommu@lists.linux-foundation.org>; Wed, 22 Jun 2022 12:59:22 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id 4140D2D0; Wed, 22 Jun 2022 14:59:20 +0200 (CEST)
Date: Wed, 22 Jun 2022 14:59:19 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2] iommu/dma: Add config for PCI SAC address trick
Message-ID: <YrMSJ6AGwn3PxSIH@8bytes.org>
References: <3f06994f9f370f9d35b2630ab75171ecd2065621.1654782107.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3f06994f9f370f9d35b2630ab75171ecd2065621.1654782107.git.robin.murphy@arm.com>
Cc: iommu@lists.linux-foundation.org, will@kernel.org,
 linux-kernel@vger.kernel.org, hch@lst.de
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

On Thu, Jun 09, 2022 at 04:12:10PM +0100, Robin Murphy wrote:
> firmware bindings by now. Let's be brave and default it to off in the

I don't have an overall good feeling about this, but as you said, let's
be brave. This is applied now to the core branch.

If it causes too much trouble we can still revert it (and re-revert it
later, ...)

Thanks,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
