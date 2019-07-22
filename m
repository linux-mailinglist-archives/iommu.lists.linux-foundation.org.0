Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 652D5701CE
	for <lists.iommu@lfdr.de>; Mon, 22 Jul 2019 15:57:38 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 173CFC9A;
	Mon, 22 Jul 2019 13:57:37 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CDC7A7F6
	for <iommu@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 13:53:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DE764775
	for <iommu@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 13:53:18 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id 31so39562707wrm.1
	for <iommu@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 06:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4A+1IXOg0AUN44xOjU2IRxHAI7jKAe/Dsm+NufqoDwo=;
	b=h5xyyPGSNmBklwByUO/gVRTUPrqta7oP6slCL4V466Dk09LzZfaKpE38pxS8G5slhy
	kCEcqJytkJuTpeJ0ZkCmKFqCNrbEfC0lUXLQOENIXbxc4dFY4fY6/OIOFSzG/uq8Fa4v
	cVik26Hf7EfFjIME2gwYiHyFu/Ime6pzaPmIvGIuziJy56HmOJs6GrwoylHcUJ0SJiP+
	N4Zfu55ZuSuimc7A33dUu6HxUibxWLmeA1uTeG0hn89lx1ChoDQ/jvmIItGHJVSZKik4
	N3+eMf1E31OR4eP4wCFFWfiNFLlHmEP5mrxCgkR2Zr+NUHrxM7UvU9ht1gVrcWcerZak
	4A1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4A+1IXOg0AUN44xOjU2IRxHAI7jKAe/Dsm+NufqoDwo=;
	b=o/qDNUsfVKoyadkYzI7Re1LE14LvN8D8EFajyiYtrPeqhSTp6ct+28ns1RpwKao2uV
	vmg5a7329MbtudA2M2s5przSCYn8cOJGdvJu3Z5gavLwPpTE3ZYig4F7tcrJ5U6pgGHg
	zVRKEYTp2AV0nhhYzgcb5l0fj3oIvvJ4h1ZqD0C3LX4P2RqXmUDmR+LRX6dNteBTwttv
	pwLb4ieOe4g7z9gIw4tU+gnozOWe8Vugxc9J1FyYWpEHDx0Ut3Mcm0+MgoA4j9T1FR/s
	ZroDrtP6ZUzlj128WnjShWQycYeHNRlS9zRz5ME9HfvxIWemfcAwc6jR5JNH7WThVpyQ
	oYow==
X-Gm-Message-State: APjAAAW+NQ2N7V1/5d+K0CmUgUWYQAv5cLyv5lfW8MoEZIca8lqnVk88
	E2sXkxOkOvmti4TSz1mpmlaNGM/lo2U=
X-Google-Smtp-Source: APXvYqywPiYMC6nufG0pkn9341YSKK0eKjFT1pvuf89bXzyjMLOex2BVhSg8UoynoCTGmuXI4lFN6w==
X-Received: by 2002:a5d:6650:: with SMTP id f16mr77388789wrw.89.1563803597410; 
	Mon, 22 Jul 2019 06:53:17 -0700 (PDT)
Received: from lophozonia.localdomain
	(cpc92304-cmbg19-2-0-cust820.5-4.cable.virginm.net. [82.24.199.53])
	by smtp.gmail.com with ESMTPSA id
	s10sm29821771wrt.49.2019.07.22.06.53.16
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 22 Jul 2019 06:53:16 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Subject: [PATCH] MAINTAINERS: Update my email address
Date: Mon, 22 Jul 2019 14:44:40 +0100
Message-Id: <20190722134438.31003-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE autolearn=unavailable
	version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Mon, 22 Jul 2019 13:57:35 +0000
Cc: virtio-dev@lists.oasis-open.org, mst@redhat.com, linux-pci@vger.kernel.org,
	maz@kernel.org, will@kernel.org, kvmarm@lists.cs.columbia.edu
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Update MAINTAINERS and .mailmap with my @linaro.org address, since I
don't have access to my @arm.com address anymore.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 0fef932de3db..8ce554b9c9f1 100644
--- a/.mailmap
+++ b/.mailmap
@@ -98,6 +98,7 @@ Jason Gunthorpe <jgg@ziepe.ca> <jgunthorpe@obsidianresearch.com>
 Javi Merino <javi.merino@kernel.org> <javi.merino@arm.com>
 <javier@osg.samsung.com> <javier.martinez@collabora.co.uk>
 Jean Tourrilhes <jt@hpl.hp.com>
+<jean-philippe@linaro.org> <jean-philippe.brucker@arm.com>
 Jeff Garzik <jgarzik@pretzel.yyz.us>
 Jeff Layton <jlayton@kernel.org> <jlayton@redhat.com>
 Jeff Layton <jlayton@kernel.org> <jlayton@poochiereds.net>
diff --git a/MAINTAINERS b/MAINTAINERS
index 783569e3c4b4..bded78c84701 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17123,7 +17123,7 @@ F:	drivers/virtio/virtio_input.c
 F:	include/uapi/linux/virtio_input.h
 
 VIRTIO IOMMU DRIVER
-M:	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
+M:	Jean-Philippe Brucker <jean-philippe@linaro.org>
 L:	virtualization@lists.linux-foundation.org
 S:	Maintained
 F:	drivers/iommu/virtio-iommu.c
-- 
2.22.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
