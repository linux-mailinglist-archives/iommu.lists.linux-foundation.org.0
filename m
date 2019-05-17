Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B3F2117A
	for <lists.iommu@lfdr.de>; Fri, 17 May 2019 02:53:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B6075AF0;
	Fri, 17 May 2019 00:53:24 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 18057AC8
	for <iommu@lists.linux-foundation.org>;
	Fri, 17 May 2019 00:53:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from usvae2-clmxp01.aristanetworks.com (smtp.aristanetworks.com
	[52.0.43.43])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AAA975E4
	for <iommu@lists.linux-foundation.org>;
	Fri, 17 May 2019 00:53:23 +0000 (UTC)
Received: from usvae2-clmxp01.aristanetworks.com (localhost [127.0.0.1])
	by usvae2-clmxp01.aristanetworks.com (Postfix) with ESMTP id
	60B3830D51F7; Thu, 16 May 2019 17:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arista.com;
	s=Arista-A; t=1558054400;
	bh=gZKRKJcuRQSwe2TyYVhO9ixqNktFM8piGcLI2AKiDUY=;
	h=From:To:Cc:Subject:Date;
	b=W0R/TFSTzK9An9pCZ5cWXkyfD+NQGfUw4fj9BddSbmVeI5W9KzH3YhRfLvhMSTLbY
	XgELyp0YcG37szHF1Wl0s4/1b3fcpwQiGZPFcx6i7mu1suwFAbtPbHor6PXaZZtjI+
	qd17afeUKsWTE/T7zBFtO1+11PUu+pwBZxz2bb3pOb1pAUSALAUs82ymFrKW5iGgmc
	yv1jZ4VSZfU+Grw+1Tp2wbCCIfe80NKqZKfCyImCDkP8KBCtHVIzWAQlwAEg99Gg6c
	Aivf/3fVaDCuC+OjZqJ/VXsXS4jwy6iQPiQPZsOJ7gjJ8U0wZZyF5aM4I1pwCSABYj
	UOYSSg8c8kZxA==
Received: from chmeee (unknown [10.95.92.211])
	by usvae2-clmxp01.aristanetworks.com (Postfix) with ESMTP id
	9C78E30D51F6; Thu, 16 May 2019 17:53:19 -0700 (PDT)
Received: from kevmitch by chmeee with local (Exim 4.92)
	(envelope-from <kevmitch@chmeee>)
	id 1hRR7e-00011A-Dt; Thu, 16 May 2019 17:53:18 -0700
To: Joerg Roedel <joro@8bytes.org>
Subject: [PATCH 0/3] handle init errors more gracefully in amd_iommu
Date: Thu, 16 May 2019 17:52:39 -0700
Message-Id: <20190517005242.20257-1-kevmitch@arista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
From: Kevin Mitchell via iommu <iommu@lists.linux-foundation.org>
Reply-To: Kevin Mitchell <kevmitch@arista.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

This series makes error handling more robust in the amd_iommu init
code. It was initially motivated by problematic firmware that does not
set up the physical address of the iommu. This led to a NULL dereference
panic when iommu_disable was called during cleanup.

While the first patch is sufficient to avoid the panic, the subsequent
two move the cleanup closer to the actual error and avoid calling the
cleanup code twice when amd_iommu=off is specified on the command line.

I have tested this series on a variety of AMD CPUs with firmware
exhibiting the issue. I have additionally tested on platforms where the
firmware has been fixed. I tried both with and without amd_iommu=off. I
have also tested on older CPUs where no IOMMU is detected and even one
where the GART driver ends up running.

Thanks,

Kevin

Kevin Mitchell (3):
  iommu/amd: make iommu_disable safer
  iommu/amd: move gart fallback to amd_iommu_init
  iommu/amd: only free resources once on init error

 drivers/iommu/amd_iommu_init.c | 45 ++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 21 deletions(-)

-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
