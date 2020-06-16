Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8741FA895
	for <lists.iommu@lfdr.de>; Tue, 16 Jun 2020 08:13:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7E3DA8952F;
	Tue, 16 Jun 2020 06:13:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FSV3amDEbHoX; Tue, 16 Jun 2020 06:13:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F17348952C;
	Tue, 16 Jun 2020 06:13:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB003C016E;
	Tue, 16 Jun 2020 06:13:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 51C84C016E
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 06:13:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4088A8952A
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 06:13:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1c4kQe-PIASM for <iommu@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 06:13:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id A035589529
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 06:13:47 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id m7so7916742plt.5
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 23:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tafn8tgvook2kdsU5HvJlEK8LMOFG+C0LcPeZd052n0=;
 b=xMAoHVNpffLY2lyTJD9QbeN8KTyRSaCCjkC1E0u2VIy0nIWcP5sclAiUAnyOV5gxo7
 oUZ5I8XHEKUPI5HHxhiuB3+rhaj6tORHBTO43Z+tK6rGQ9KB52CJoor8yhS92yQgrJE5
 UsjsHN6CB7p6Wvnm/t05rV2XL0Eo3w/Gkepsz9Lk2uCVqEdP/Onw398cCpRDh4z/aPsk
 5kwkQUlYMQYiuf9ijlJaEIfoKmdY1YHHs4x+UsDUtjNA4biCYzwLJRQYBD8q1MHKJKT7
 XGf7sL+4v7hVAdKG6ictgI5vbmId+R5Vnm1ZlDViPyMrg6hBsc/jbJsngf/Sj51SRZS+
 AcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tafn8tgvook2kdsU5HvJlEK8LMOFG+C0LcPeZd052n0=;
 b=iyeoIx9yXjlxjyWqKF6dBOEIpj4DuhTpTfAXXbaruO89tigbVpFvqk1ezUexzx+3uy
 vzNLF9fib8KHjALZECNRj1f6gvn4ncHxYhXMi35Fpaxhob1vn2wMWOpKiAGmnpAAJ8J4
 rCpu7KSJSv39srIUPDwu3/1GQoq6Cgjs/1sK9ybNev6ZaxRA2/lb/qdxQhgFxCHH4aNI
 +rb+UqVTonHACLgVteOYkMGKmMrDG0UU6tcE0ChT38F6oJfkUIC6ap8mCh1m+CnGEVQg
 NuxNTh7fAo8ph6Rze9Bmcfb+4aB83+QhQJfkex5MBkVvpxbvWPgGpsHTUO8PzDdu3cwc
 mxEA==
X-Gm-Message-State: AOAM532wbUXziIfQvB30rj6yMr03ge9EKdqnTcauGBkAaJ9DGGKNEwgA
 A0UHcyjalNe6j6T8wxhYq3hkaA==
X-Google-Smtp-Source: ABdhPJwzpEnEW8XPSBOBq1A7hYTb2UNoutUZvIjQpKbpwqGbOmCOIwyYxiTOyT5TfnOfy6VyShAGtg==
X-Received: by 2002:a17:902:8f98:: with SMTP id
 z24mr796330plo.123.1592288027157; 
 Mon, 15 Jun 2020 23:13:47 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 i26sm15642032pfo.0.2020.06.15.23.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 23:13:46 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH 4/5] pinctrl: qcom: Allow pinctrl-msm code to be loadable
 as a module
Date: Tue, 16 Jun 2020 06:13:37 +0000
Message-Id: <20200616061338.109499-5-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616061338.109499-1-john.stultz@linaro.org>
References: <20200616061338.109499-1-john.stultz@linaro.org>
Cc: Jason Cooper <jason@lakedaemon.net>, Saravana Kannan <saravanak@google.com>,
 Marc Zyngier <maz@kernel.org>, Lina Iyer <ilina@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-gpio@vger.kernel.org,
 iommu@lists.linux-foundation.org, Andy Gross <agross@kernel.org>,
 John Stultz <john.stultz@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>,
 linux-arm-msm@vger.kernel.org, Todd Kjos <tkjos@google.com>
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

Tweaks to allow pinctrl-msm code to be loadable as a module.
This is needed in order to support having the qcom-scm driver,
which pinctrl-msm calls into, configured as a module.

Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Lina Iyer <ilina@codeaurora.org>
Cc: Saravana Kannan <saravanak@google.com>
Cc: Todd Kjos <tkjos@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: iommu@lists.linux-foundation.org
Cc: linux-gpio@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 drivers/pinctrl/qcom/Kconfig       | 2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index ff1ee159dca2..5a7e1bc621e6 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -2,7 +2,7 @@
 if (ARCH_QCOM || COMPILE_TEST)
 
 config PINCTRL_MSM
-	bool
+	tristate
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 83b7d64bc4c1..54a226f682e9 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1355,3 +1355,6 @@ int msm_pinctrl_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL(msm_pinctrl_remove);
 
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. pinctrl-msm driver");
+MODULE_LICENSE("GPL v2");
+
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
