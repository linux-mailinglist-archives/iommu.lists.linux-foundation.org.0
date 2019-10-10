Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE58D33EC
	for <lists.iommu@lfdr.de>; Fri, 11 Oct 2019 00:28:54 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 90EBFF4F;
	Thu, 10 Oct 2019 22:28:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C7462E2B
	for <iommu@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 22:28:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7D89E6CE
	for <iommu@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 22:28:39 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id b8so4540291pgm.13
	for <iommu@lists.linux-foundation.org>;
	Thu, 10 Oct 2019 15:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=1ik/kSfKAQ4ZckUQirkRuCGEWrJxiH/kxb4IaqRf84E=;
	b=aS2nSWkBo2EM7xurh9e4KD3J/oEH5CMiR6qi6pemFdHozgo2Z1c7TRj96V/PkiHjw5
	FH6oKRaTNJzzH6k22JYKIFTE4RYwim+fu31Qx8OPm3DvD1SWi/W3PN1N9EnLTNV8O95r
	DXzrAuTvAi+zfUbmq8Hja0TWbbmGpPw9eXOoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1ik/kSfKAQ4ZckUQirkRuCGEWrJxiH/kxb4IaqRf84E=;
	b=VS6e1A1m1ogI6unNeHkzEocAVgPIb0UcrzTtM/7zEzBXpePk/KlFN8LiurpjMRiw3S
	DUqgw9/w5FHQNDrBCtSS3x1dTJxC6ezNOQ5TuNazq0beymdg/fqYqKTANjj1+rHzp8A6
	uGOJGrMVH+ecgN7YZkAxLHXKCHYSwiK/Y0OmaKWq8f0gdB7CkeYPDEooZwLdYsuieukl
	Bt+tUWDUFHwitkwUG2SyPcEsfmN8EHSuGb54fXd6AxAxoqOoyErcNBzz/q9ncYrJ1EIi
	h8535E5kNy3pjOyuA2WlQshEER3uP9gOg1iuqdMKTnnMA3znJVRuUzjftbKB6zdnpGm4
	prew==
X-Gm-Message-State: APjAAAWeQj8fT82YkW0Am1T3ajjkER6q1I1tsSG0KabENX2c+T41F1XX
	1LRos8/Gu22Z7V8Ved+ZLxGoCw==
X-Google-Smtp-Source: APXvYqwiSLikkNRk0PtrKKYtoloMR4gcGK6Rx79wulZ5k/6xZ+dNXHBqNJrJBq6aMzrzeheKM691Vw==
X-Received: by 2002:a63:287:: with SMTP id 129mr13610227pgc.190.1570746518937; 
	Thu, 10 Oct 2019 15:28:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id
	c10sm7203427pfo.49.2019.10.10.15.28.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 10 Oct 2019 15:28:36 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: [PATCH v3 0/2] dma-mapping: Add vmap checks to dma_map_single()
Date: Thu, 10 Oct 2019 15:28:27 -0700
Message-Id: <20191010222829.21940-1-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Kees Cook <keescook@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
	iommu@lists.linux-foundation.org,
	Semmle Security Reports <security-reports@semmle.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Jesper Dangaard Brouer <brouer@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, Laura Abbott <labbott@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>, Allison Randal <allison@lohutok.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Duplicating patch 1 commit log:

As we've seen from USB and other areas[1], we need to always do runtime
checks for DMA operating on memory regions that might be remapped. This
adds vmap checks (similar to those already in USB but missing in other
places) into dma_map_single() so all callers benefit from the checking.

[1] https://git.kernel.org/linus/3840c5b78803b2b6cc1ff820100a74a092c40cbb

-Kees

v3:
 - switch to dev_warn() (gregkh, hch)
 - split USB cleanup into a separate patch
v2: https://lore.kernel.org/lkml/201910041420.F6E55D29A@keescook
v1: https://lore.kernel.org/lkml/201910021341.7819A660@keescook

Kees Cook (2):
  dma-mapping: Add vmap checks to dma_map_single()
  usb: core: Remove redundant vmap checks

 drivers/usb/core/hcd.c      | 8 +-------
 include/linux/dma-mapping.h | 6 ++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.17.1
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
