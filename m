Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id BA40C1E3358
	for <lists.iommu@lfdr.de>; Wed, 27 May 2020 01:03:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6C3C486A85;
	Tue, 26 May 2020 23:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K0jCNlklSJ6M; Tue, 26 May 2020 23:03:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B262986A7F;
	Tue, 26 May 2020 23:03:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 97E91C088D;
	Tue, 26 May 2020 23:03:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39FD7C016F
 for <iommu@lists.linux-foundation.org>; Tue, 26 May 2020 23:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 28B4F20512
 for <iommu@lists.linux-foundation.org>; Tue, 26 May 2020 23:03:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5N2vRNik7eSr for <iommu@lists.linux-foundation.org>;
 Tue, 26 May 2020 23:03:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from smtp.ispras.ru (winnie.ispras.ru [83.149.199.91])
 by silver.osuosl.org (Postfix) with ESMTP id B995F204C7
 for <iommu@lists.linux-foundation.org>; Tue, 26 May 2020 23:03:09 +0000 (UTC)
Received: from monopod.intra.ispras.ru (monopod.intra.ispras.ru [10.10.3.121])
 by smtp.ispras.ru (Postfix) with ESMTP id 2DE63201D0;
 Wed, 27 May 2020 02:03:05 +0300 (MSK)
Date: Wed, 27 May 2020 02:03:05 +0300 (MSK)
From: Alexander Monakov <amonakov@ispras.ru>
To: iommu@lists.linux-foundation.org
Subject: AMD IOMMU perf counters on Zen2
Message-ID: <alpine.LNX.2.20.13.2005270150160.8241@monopod.intra.ispras.ru>
User-Agent: Alpine 2.20.13 (LNX 116 2015-12-14)
MIME-Version: 1.0
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

Hello,

I'd like to use IOMMU perf counters on a Zen 2 CPU (Ryzen 4500U, Renoir SoC).
Unfortunately, init_iommu_perf_ctr fails because val2 != val, i.e. the
counter appears not writable. However, if I patch the kernel to skip this
check, the counters seem to increment when configured with perf tool.

Do you know why the counter might appear not writable in newer CPUs?

Thanks.
Alexander
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
