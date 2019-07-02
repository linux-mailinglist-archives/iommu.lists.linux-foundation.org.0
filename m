Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 8363D5D78C
	for <lists.iommu@lfdr.de>; Tue,  2 Jul 2019 22:31:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1BBE3215B;
	Tue,  2 Jul 2019 20:31:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 972F7212A
	for <iommu@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 20:26:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 1DB05834
	for <iommu@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 20:26:58 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id w17so20130223qto.10
	for <iommu@lists.linux-foundation.org>;
	Tue, 02 Jul 2019 13:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=J/H70/FePQbdKZEz0YI3H5/o3CPPkZQZGrIygUbL5uE=;
	b=TCnekBuPYD3hUrz8zIp0zu2L4/GpJvf48ABFai2kUMx5JRSj+cJ9F4qllXaSyBUW3P
	jUaysD401DDUnfOo3Klccf/XsoXJ16g19L5I8D93FmKem3TenRjTAPawa623RFJCL6qK
	d63Y6sMyeBjwYA4P/+VM58+DDKEo538UFqKZCsoF75gu8J+6hJVvOWOGyd58UpTYAb57
	q5Ld3cG0P/Xnf8kMmLLMqTAZ1oqG80KTqDM7j+N5I9qC+N6LWOdROwCPko32+cCB7Ltn
	Y3vEBK04m3JwgwmnrrbIBtdJmXO9XPmSAo0oShklDieS2klivlvOqFdhJBLIoDcBywvk
	KvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=J/H70/FePQbdKZEz0YI3H5/o3CPPkZQZGrIygUbL5uE=;
	b=YLguQt3WiuYNl6Y2fh419MZnTCGJ+4WWBvRNzJO5cBKwHd0NLkOumOZ8Q6KWg6oLIr
	8li+3kCk3VEn54O+fGkKspQlNxRb+eMxnNjFJ9ogdyZvaFnWViYY/88uliBPlP3XAcYa
	AI1Ya6rz52g0QVsWt/Fn2AfBz4YoigcN7Q0XcVxFO7mbsvy0JJToUP+psfJ3DFHZ9z/F
	ZG1frEzHO3nV6V8OL1FBwiboNGT/28zJPbXODvKZBHCSESa1MnbkBJvoqLhoe6zXzg18
	Y3V7UbBE6qXZjFH+M+/+nSzGqPI9cyLUzepEw1kC5U6tZ8ERCo0s99RKn6ciHu9bVbPS
	VmRQ==
X-Gm-Message-State: APjAAAUkyEWjR8qI4eAFH0MBrIImCJhfA9nUiqN5qO0yB0aowieOF5B7
	kwZKmD27WmzsYRIsq8tlsMO8SHf6jalfGw==
X-Google-Smtp-Source: APXvYqwBpRrG3Pu/9gU8tjH7/kzX84pSdwZg+HHw7dt535o3fbveN8pbp8WelpaRmR8Le4djtZu+DQ==
X-Received: by 2002:ac8:36b9:: with SMTP id a54mr27547900qtc.300.1562099216912;
	Tue, 02 Jul 2019 13:26:56 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
	by smtp.gmail.com with ESMTPSA id
	d38sm7249904qtb.95.2019.07.02.13.26.56
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 02 Jul 2019 13:26:56 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] iommu: add support for drivers that manage iommu
	explicitly
Date: Tue,  2 Jul 2019 13:26:18 -0700
Message-Id: <20190702202631.32148-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202631.32148-1-robdclark@gmail.com>
References: <20190702202631.32148-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>, Joe Perches <joe@perches.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
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

From: Rob Clark <robdclark@chromium.org>

Avoid attaching any non-driver managed domain if the driver indicates
that it manages the iommu directly.

This solves a couple problems that drm/msm + arm-smmu has with the iommu
framework:

1) In some cases the bootloader takes the iommu out of bypass and
   enables the display.  This is in particular a problem on the aarch64
   laptops that exist these days, and modern snapdragon android devices.
   (Older devices also enabled the display in bootloader but did not
   take the iommu out of bypass.)  Attaching a DMA or IDENTITY domain
   while scanout is active, before the driver has a chance to intervene,
   makes things go *boom*

2) We are currently blocked on landing support for GPU per-context
   pagetables because of the domain attached before driver's ->probe()
   is called.

This solves both problems.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/iommu.c  | 11 +++++++++++
 include/linux/device.h |  3 ++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 0c674d80c37f..efa0957f9772 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -1573,6 +1573,17 @@ static int __iommu_attach_device(struct iommu_domain *domain,
 	    domain->ops->is_attach_deferred(domain, dev))
 		return 0;
 
+	/*
+	 * If driver is going to manage iommu directly, then avoid
+	 * attaching any non driver managed domain.  There could
+	 * be already active dma underway (ie. scanout in case of
+	 * bootloader enabled display), and interfering with that
+	 * will make things go *boom*
+	 */
+	if ((domain->type != IOMMU_DOMAIN_UNMANAGED) &&
+	    dev->driver && dev->driver->driver_manages_iommu)
+		return 0;
+
 	if (unlikely(domain->ops->attach_dev == NULL))
 		return -ENODEV;
 
diff --git a/include/linux/device.h b/include/linux/device.h
index e138baabe01e..d98aa4d3c8c3 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -282,7 +282,8 @@ struct device_driver {
 	struct module		*owner;
 	const char		*mod_name;	/* used for built-in modules */
 
-	bool suppress_bind_attrs;	/* disables bind/unbind via sysfs */
+	bool suppress_bind_attrs:1;	/* disables bind/unbind via sysfs */
+	bool driver_manages_iommu:1;	/* driver manages IOMMU explicitly */
 	enum probe_type probe_type;
 
 	const struct of_device_id	*of_match_table;
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
