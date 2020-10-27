Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 498A429A98D
	for <lists.iommu@lfdr.de>; Tue, 27 Oct 2020 11:26:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id DB0A186726;
	Tue, 27 Oct 2020 10:26:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WQrCkbyg7Kza; Tue, 27 Oct 2020 10:26:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 582E186700;
	Tue, 27 Oct 2020 10:26:05 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 38883C0051;
	Tue, 27 Oct 2020 10:26:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 14E60C0051
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 10:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 03E4087253
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 10:26:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3aohH0P3lUXh for <iommu@lists.linux-foundation.org>;
 Tue, 27 Oct 2020 10:26:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0A3EC8718E
 for <iommu@lists.linux-foundation.org>; Tue, 27 Oct 2020 10:25:59 +0000 (UTC)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id DE5A7AE80276;
 Tue, 27 Oct 2020 06:18:07 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v2 0/2] DMA,
 powerpc/dma: Fallback to dma_ops when persistent memory present
Date: Tue, 27 Oct 2020 21:18:39 +1100
Message-Id: <20201027101841.96056-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
Cc: Michael Ellerman <mpe@ellerman.id.au>, iommu@lists.linux-foundation.org,
 Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

This allows mixing direct DMA (to/from RAM) and
IOMMU (to/from apersistent memory) on the PPC64/pseries
platform.

This replaces this: https://lkml.org/lkml/2020/10/20/1085
A lesser evil this is :)

This is based on sha1
4525c8781ec0 Linus Torvalds "scsi: qla2xxx: remove incorrect sparse #ifdef".

Please comment. Thanks.



Alexey Kardashevskiy (2):
  dma: Allow mixing bypass and normal IOMMU operation
  powerpc/dma: Fallback to dma_ops when persistent memory present

 arch/powerpc/kernel/dma-iommu.c        | 12 ++++-
 arch/powerpc/platforms/pseries/iommu.c | 44 ++++++++++++++-----
 kernel/dma/mapping.c                   | 61 +++++++++++++++++++++++++-
 arch/powerpc/Kconfig                   |  1 +
 kernel/dma/Kconfig                     |  4 ++
 5 files changed, 108 insertions(+), 14 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
