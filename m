Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E46BCE921E
	for <lists.iommu@lfdr.de>; Tue, 29 Oct 2019 22:34:48 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 33611C96;
	Tue, 29 Oct 2019 21:34:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C58E2BE4
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 21:34:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 849F6FD
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 21:34:38 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id r4so15263pfl.7
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 14:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=lWZTdL/Ycl8L0zHYWfiupMxq7Qm95AxSDKo9H9BjXP8=;
	b=PRPobR6gff4iW7vcCqcliQQ2oTk2SnbL8tep2tCUVzkcxNRl9kIhbYrI0UZMRt2ZBD
	s8zqYEHq7hULtExyjugBuG1AAI8jmk+j58vggEJbxAHdb9xFOSFXXWxF8djA4CEu9LLa
	fFzfhyeUIWTDJ1d+OPsqcjOknJBVkNA9BlKUw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lWZTdL/Ycl8L0zHYWfiupMxq7Qm95AxSDKo9H9BjXP8=;
	b=RmkGn0d9pjazQVzGChwT6m92BkPLgHcPFknQdgvNEhOxY743dVwcAVN/ZbX7ym8I9t
	1pwG4nIBt3PxXddBdXeaK0IM8jNQEnyQ+3lZzGpN3sLzHxxtef2pYwjLoOD75EK5ITx3
	BwP2u+ei/v12JD32fYVZ2WRuok7erKIbSExJp2kOeKNMQ+VacRhgNiHDHDl2iAWy4teF
	X0oX7blMlfWZulWHewikJt1qFotuigzUG4WUp7stInNQJpeb2V+GGyKI0hVGLFteuxyl
	Cy5MybQl2uDVyFETPoVXuUJWNc7KbXlf7We9wptmH8xzHitTqcHgvZNNMnSvI+ANOkVR
	fb6A==
X-Gm-Message-State: APjAAAVRvxrALRu7PIsNWJn0CGRyuvHtOZVLD56A1GuALIImxrLPSDgF
	M4QOXphk4kcWovcgY/AD4k7pzQ==
X-Google-Smtp-Source: APXvYqx3aH3CH+BULx4DuU0U+ZlkEU3+HCKNDcRvDP7umOsBNHrdd7xxt2fFHmJl0bdYYD6n/7hL1g==
X-Received: by 2002:a63:ff65:: with SMTP id s37mr16005991pgk.331.1572384878116;
	Tue, 29 Oct 2019 14:34:38 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
	by smtp.gmail.com with ESMTPSA id q6sm176825pgn.44.2019.10.29.14.34.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 29 Oct 2019 14:34:36 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: [PATCH v4 0/2] dma-mapping: Add vmap checks to dma_map_single()
Date: Tue, 29 Oct 2019 14:34:21 -0700
Message-Id: <20191029213423.28949-1-keescook@chromium.org>
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

v4: use dev_WARN_ONCE() and improve report string (gregkh, robin)
v3: https://lore.kernel.org/lkml/20191010222829.21940-1-keescook@chromium.org
v2: https://lore.kernel.org/lkml/201910041420.F6E55D29A@keescook
v1: https://lore.kernel.org/lkml/201910021341.7819A660@keescook

Duplicating patch 1 commit log:

As we've seen from USB and other areas[1], we need to always do runtime
checks for DMA operating on memory regions that might be remapped. This
adds vmap checks (similar to those already in USB but missing in other
places) into dma_map_single() so all callers benefit from the checking.

[1] https://git.kernel.org/linus/3840c5b78803b2b6cc1ff820100a74a092c40cbb

-Kees

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
