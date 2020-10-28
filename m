Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 121D629CE6F
	for <lists.iommu@lfdr.de>; Wed, 28 Oct 2020 08:00:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A670F868C8;
	Wed, 28 Oct 2020 07:00:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h7Wx1a7321gj; Wed, 28 Oct 2020 07:00:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 257DD867B9;
	Wed, 28 Oct 2020 07:00:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 10BA3C0051;
	Wed, 28 Oct 2020 07:00:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4053FC0051
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 07:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 16BC986B74
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 07:00:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V0C8js2PUgj2 for <iommu@lists.linux-foundation.org>;
 Wed, 28 Oct 2020 07:00:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by whitealder.osuosl.org (Postfix) with ESMTP id 11121868E6
 for <iommu@lists.linux-foundation.org>; Wed, 28 Oct 2020 07:00:35 +0000 (UTC)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id ED6EFAE80273;
 Wed, 28 Oct 2020 02:59:51 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v3 0/2] DMA,
 powerpc/dma: Fallback to dma_ops when persistent memory present
Date: Wed, 28 Oct 2020 18:00:28 +1100
Message-Id: <20201028070030.60643-1-aik@ozlabs.ru>
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

This replaces https://lkml.org/lkml/2020/10/27/418
which replaces https://lkml.org/lkml/2020/10/20/1085


This is based on sha1
4525c8781ec0 Linus Torvalds "scsi: qla2xxx: remove incorrect sparse #ifdef".

Please comment. Thanks.



Alexey Kardashevskiy (2):
  dma: Allow mixing bypass and mapped DMA operation
  powerpc/dma: Fallback to dma_ops when persistent memory present

 arch/powerpc/kernel/dma-iommu.c        | 70 +++++++++++++++++++++++++-
 arch/powerpc/platforms/pseries/iommu.c | 44 ++++++++++++----
 kernel/dma/mapping.c                   | 24 +++++++--
 arch/powerpc/Kconfig                   |  1 +
 kernel/dma/Kconfig                     |  4 ++
 5 files changed, 127 insertions(+), 16 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
