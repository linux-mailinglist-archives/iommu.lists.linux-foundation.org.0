Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDC1539DB8
	for <lists.iommu@lfdr.de>; Wed,  1 Jun 2022 09:07:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA7D4814BB;
	Wed,  1 Jun 2022 07:07:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DGDYG3rKIh0z; Wed,  1 Jun 2022 07:07:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id C03A1814B8;
	Wed,  1 Jun 2022 07:07:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9C954C002D;
	Wed,  1 Jun 2022 07:07:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4F66C002D
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 07:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D2D3160E07
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 07:07:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=google.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t-BQ-PNsF1k8 for <iommu@lists.linux-foundation.org>;
 Wed,  1 Jun 2022 07:07:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3651E60AA3
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 07:07:30 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-30026cf9af8so8618927b3.3
 for <iommu@lists.linux-foundation.org>; Wed, 01 Jun 2022 00:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=eS/2TM+GfDlfIh94cuHfgXIohxcqeVLl/51vayxOGcM=;
 b=nEbS5SUQKPV2uEuRcyqOCeYxkIcVm6QtbRuafH1IWgffM/UiSk4n7jieCoUxjX9Oaq
 WdF2MZAjtTV+A+oRtPcrP2vyYILJP7A+Sg3USDA4WMYh1mFqe4FUjmEsa0guT0E1V4tj
 CRvpIOw9ggRCgKvj+BCr2MskAML9dPYYf+XO0/d9/Xj9Uc/+LTk7YMR8wiug+nW8uluL
 vowkrv4PAa7gy873wiXvd7t6in/QuT1Qpd5KLLyCXllUZoQDqvWM1KUKzksMRYWJwumF
 +1QzKxLzBi0hg9GJrGLwC8SMCfssBQpKzUmvRevuplmTStk4Ali/UF0v2Vw1hH1Gn3Yl
 JBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=eS/2TM+GfDlfIh94cuHfgXIohxcqeVLl/51vayxOGcM=;
 b=LTRGW7Jm64yDnT6VEay+TJ6bbv3/tMfmn4Pp8vc1c1toeS3TZHEiPqs8fL+/xXGezy
 SVSlOEj2IODF+kGS6g1GFhHOa3rqEapoc440+7PGKO/0OqR2j/OggsukMranrGc5pj1/
 UWMTLEsy6cxR1fiRTJcQkT2ygk/TRa6tmMMRe1E1Z1wHy2lGPcpFaywZOeBqTacQmz6V
 v7kDs94qxjrXbJiNy/v2ca3QUwuvnfiU5vVBefitvD8j+tg3yV47mrWElp9DdLKbe39e
 9m/D5j9/PfytFlLYxl1Wq27owy9XkKhzvDwizLwLkJaGoH9O7Bca3cEL+uao2djFMufw
 XV4A==
X-Gm-Message-State: AOAM53313wzsgKzxvCJEQUgkwRSv129bmHB4gmh4w33HrxF7NXv+zw35
 VC26bGEvYUrKkAffexOdHZAtRFMmup805As=
X-Google-Smtp-Source: ABdhPJwtAnnXhJAd8leQI7IsJQYpPEGmerba49yF9GJ2QPuTWzcc40IB9+ccBefvJrVmInskP9rGOF8g1cQWJjY=
X-Received: from saravanak.san.corp.google.com
 ([2620:15c:2d:3:f3aa:cafe:c20a:e136])
 (user=saravanak job=sendgmr) by 2002:a81:ac67:0:b0:30c:4692:77fd with SMTP id
 z39-20020a81ac67000000b0030c469277fdmr16106442ywj.180.1654067249191; Wed, 01
 Jun 2022 00:07:29 -0700 (PDT)
Date: Wed,  1 Jun 2022 00:07:02 -0700
In-Reply-To: <20220601070707.3946847-1-saravanak@google.com>
Message-Id: <20220601070707.3946847-7-saravanak@google.com>
Mime-Version: 1.0
References: <20220601070707.3946847-1-saravanak@google.com>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
Subject: [PATCH v2 6/9] Revert "driver core: Set default deferred_probe_timeout
 back to 0."
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
 Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Linus Walleij <linus.walleij@linaro.org>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, 
 David Ahern <dsahern@kernel.org>
Cc: Saravana Kannan <saravanak@google.com>, linux-pm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, iommu@lists.linux-foundation.org,
 kernel-team@android.com
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
From: Saravana Kannan via iommu <iommu@lists.linux-foundation.org>
Reply-To: Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

This reverts commit 11f7e7ef553b6b93ac1aa74a3c2011b9cc8aeb61.

Let's take another shot at getting deferred_probe_timeout=10 to work.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/base/dd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 4a55fbb7e0da..335e71d3a618 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -256,7 +256,12 @@ static int deferred_devs_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(deferred_devs);
 
+#ifdef CONFIG_MODULES
+int driver_deferred_probe_timeout = 10;
+#else
 int driver_deferred_probe_timeout;
+#endif
+
 EXPORT_SYMBOL_GPL(driver_deferred_probe_timeout);
 
 static int __init deferred_probe_timeout_setup(char *str)
-- 
2.36.1.255.ge46751e96f-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
