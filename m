Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B496528FCF
	for <lists.iommu@lfdr.de>; Fri, 24 May 2019 06:08:07 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A8F4DAD7;
	Fri, 24 May 2019 04:08:05 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 940DBAA5
	for <iommu@lists.linux-foundation.org>;
	Fri, 24 May 2019 04:08:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4DC68F4
	for <iommu@lists.linux-foundation.org>;
	Fri, 24 May 2019 04:08:03 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id w22so4271118pgi.6
	for <iommu@lists.linux-foundation.org>;
	Thu, 23 May 2019 21:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=s74YDk11h63m3BV7XOfnkCuG6v9uaJVVe9rNVON22hw=;
	b=d4pWEaoDp8VDALdkCMCsdpaApDEtbf5qlmNVmtFaBu1dLqdJeDQAeAOVmLHxFoOH2T
	0KPvaAWTEKyeMBhm+4UC/dQvOjY/nwyM/qO/nbiRmBo9pAvmEWRw/GbN6v2yEXKE6Uif
	1IVZz6BJJxpjuO+gvH0PYvuK5AFQh4McrEeM76gok5/33Q0ciesPflsroAVXZ5CsyzON
	H9/F8sXGiqPEYQIxTFKTAnibA8qNWGGUiMepgWhsAhmj72HmkGQ6ip5T7JMixrDb59Q5
	1AG8HJWjKIuoZaWZHwFRH4weX2//KEgT50ICzsbyxb+ZFJk+oWktK+KDA2/H+LGKg1UJ
	zN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=s74YDk11h63m3BV7XOfnkCuG6v9uaJVVe9rNVON22hw=;
	b=kREKRclCl3JnOJu4EmFLzTfNmApXOJMim6/rEY8V9MSKa3VoT3W2OOi+iJiESjm9WU
	EuBYPuvuuTzc9qAz6yk/TazaD9TRX5eH+oL2WAE85nbydnDDobAZDsb7xq4zOdMX4foh
	vRWhje3DySCj4IMfPzKM+yNqZjPts+T2rOguG+irx7rla26ZelIqVIfw1S0kOIfa+68Y
	GO4a8BbMDSdK4/YUIQo3A5kDyjY87SGzIUQXJQZODTUCYtZP5M5O87cCpf7w9f8LCtJp
	VWcze2C3WL4tW0hXGzdfFDqTFltGvkor/LCOC2EjriKHawp0Hyp3yUsBlFHfc+KrPxtr
	QO9w==
X-Gm-Message-State: APjAAAUEc0AXTvnlS8E2ljLPz99MyNl/wM38mehFidCk0xi4tRQRor8I
	7VEjdMBGu1mXbt+UDGWzwmA=
X-Google-Smtp-Source: APXvYqz7SgXlmeiaXSvQX7Xs4PBLb1OsSy441YSgpyHE/mSRMUQEJbvKztTfbmY/Z7v8FcGOYR8dGA==
X-Received: by 2002:aa7:9aa5:: with SMTP id x5mr18456270pfi.135.1558670882701; 
	Thu, 23 May 2019 21:08:02 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
	[216.228.112.22]) by smtp.gmail.com with ESMTPSA id
	e123sm786412pgc.29.2019.05.23.21.08.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 21:08:02 -0700 (PDT)
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: hch@lst.de,
	robin.murphy@arm.com,
	m.szyprowski@samsung.com
Subject: [PATCH v3 0/2] Optimize dma_*_from_contiguous calls
Date: Thu, 23 May 2019 21:06:31 -0700
Message-Id: <20190524040633.16854-1-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: chris@zankel.net, linux-xtensa@linux-xtensa.org, keescook@chromium.org,
	sfr@canb.auug.org.au, tony@atomide.com, catalin.marinas@arm.com,
	will.deacon@arm.com, linux@armlinux.org.uk,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	jcmvbkbc@gmail.com, wsa+renesas@sang-engineering.com,
	dann.frazier@canonical.com, akpm@linux-foundation.org,
	treding@nvidia.com, dwmw2@infradead.org, iamjoonsoo.kim@lge.com,
	linux-arm-kernel@lists.infradead.org
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

[ Per discussion at v1, we decide to add two new functions and start
  replacing callers one by one. For this series, it only touches the
  dma-direct part. And instead of merging two PATCHes, I still keep
  them separate so that we may easily revert PATCH-2 if anything bad
  happens as last time -- PATCH-1 is supposed to be a safe cleanup. ]

This series of patches try to optimize dma_*_from_contiguous calls:
PATCH-1 abstracts two new functions and applies to dma-direct.c file.
PATCH-2 saves single pages and reduce fragmentations from CMA area.

Please check their commit messages for detail changelog.

Nicolin Chen (2):
  dma-contiguous: Abstract dma_{alloc,free}_contiguous()
  dma-contiguous: Use fallback alloc_pages for single pages

 include/linux/dma-contiguous.h | 11 +++++++
 kernel/dma/contiguous.c        | 57 ++++++++++++++++++++++++++++++++++
 kernel/dma/direct.c            | 24 +++-----------
 3 files changed, 72 insertions(+), 20 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
