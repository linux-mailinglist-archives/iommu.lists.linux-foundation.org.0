Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D64539C71
	for <lists.iommu@lfdr.de>; Wed,  1 Jun 2022 07:16:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48C0E60D4D;
	Wed,  1 Jun 2022 05:16:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 43gd9GAH7Pd4; Wed,  1 Jun 2022 05:16:31 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 87A1360ADD;
	Wed,  1 Jun 2022 05:16:31 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59ED8C0081;
	Wed,  1 Jun 2022 05:16:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F0E8EC002D
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 05:16:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9272410BC
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 05:16:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wJwpGEZatZg1 for <iommu@lists.linux-foundation.org>;
 Wed,  1 Jun 2022 05:16:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A7212410B4
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 05:16:27 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 26A9368AFE; Wed,  1 Jun 2022 07:16:22 +0200 (CEST)
Date: Wed, 1 Jun 2022 07:16:21 +0200
From: Christoph Hellwig <hch@lst.de>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] dma-debug: Make things less spammy under memory pressure
Message-ID: <20220601051621.GA21535@lst.de>
References: <20220531215106.192271-1-robdclark@gmail.com>
 <39d1fa65-8e82-721c-171e-ef36bda1c561@arm.com>
 <CAF6AEGuMN23hxe1+PES-F0rgXDnxi48OfbdHKasPGVnbFvQ8rw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGuMN23hxe1+PES-F0rgXDnxi48OfbdHKasPGVnbFvQ8rw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: Rob Clark <robdclark@chromium.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
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

On Tue, May 31, 2022 at 03:19:45PM -0700, Rob Clark wrote:
> um, quite..  tbf that was in the context of a WIP igt test for
> shrinker which was trying to cycle thru ~2x RAM size worth of GEM
> buffers on something like 72 threads.  So it could just be threads
> that had gotten past the dma_debug_disabled() check already before
> global_disable was set to true?
> 
> I guess this could be pr_err_once() instead, then?

Yes, we could use pr_err_once to reduce the chattyness while still
keeping global_disable to disable all the actual tracking.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
