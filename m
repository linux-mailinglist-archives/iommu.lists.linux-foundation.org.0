Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FD61EA074
	for <lists.iommu@lfdr.de>; Mon,  1 Jun 2020 11:02:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D574886B7A;
	Mon,  1 Jun 2020 09:01:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lmNhVpCozu3K; Mon,  1 Jun 2020 09:01:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BE81A85FD5;
	Mon,  1 Jun 2020 09:01:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 948D7C0176;
	Mon,  1 Jun 2020 09:01:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8F352C0176
 for <iommu@lists.linux-foundation.org>; Mon,  1 Jun 2020 09:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 81C0D87A6E
 for <iommu@lists.linux-foundation.org>; Mon,  1 Jun 2020 09:01:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Co4R0HmBXyQv for <iommu@lists.linux-foundation.org>;
 Mon,  1 Jun 2020 09:01:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.ispras.ru (winnie.ispras.ru [83.149.199.91])
 by hemlock.osuosl.org (Postfix) with ESMTP id E7BD487A56
 for <iommu@lists.linux-foundation.org>; Mon,  1 Jun 2020 09:01:52 +0000 (UTC)
Received: from monopod.intra.ispras.ru (monopod.intra.ispras.ru [10.10.3.121])
 by smtp.ispras.ru (Postfix) with ESMTP id D9D7C203BF;
 Mon,  1 Jun 2020 12:01:48 +0300 (MSK)
Date: Mon, 1 Jun 2020 12:01:48 +0300 (MSK)
From: Alexander Monakov <amonakov@ispras.ru>
To: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Subject: Re: [PATCH] iommu/amd: Fix event counter availability check
In-Reply-To: <56761139-f794-39b1-4dfa-dfc05fbe5f60@amd.com>
Message-ID: <alpine.LNX.2.20.13.2006011132530.16067@monopod.intra.ispras.ru>
References: <20200529200738.1923-1-amonakov@ispras.ru>
 <56761139-f794-39b1-4dfa-dfc05fbe5f60@amd.com>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
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

On Mon, 1 Jun 2020, Suravee Suthikulpanit wrote:

> > Moving init_iommu_perf_ctr just after iommu_flush_all_caches resolves
> > the issue. This is the earliest point in amd_iommu_init_pci where the
> > call succeeds on my laptop.
> 
> According to your description, it should just need to be anywhere after the
> pci_enable_device() is called for the IOMMU device, isn't it? So, on your
> system, what if we just move the init_iommu_perf_ctr() here:

No, this doesn't work, as I already said in the paragraph you are responding
to. See my last sentence in the quoted part.

So the implication is init_device_table_dma together with subsequent cache
flush is also setting up something that is necessary for counters to be
writable.

Alexander
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
