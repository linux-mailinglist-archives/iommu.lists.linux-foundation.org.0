Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BDA534B50
	for <lists.iommu@lfdr.de>; Thu, 26 May 2022 10:16:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1FF69613DE;
	Thu, 26 May 2022 08:16:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jgmR4Mos58Ci; Thu, 26 May 2022 08:16:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 4F1C961319;
	Thu, 26 May 2022 08:16:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2A2CEC007C;
	Thu, 26 May 2022 08:16:11 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EA096C002D
 for <iommu@lists.linux-foundation.org>; Thu, 26 May 2022 08:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E60B361311
 for <iommu@lists.linux-foundation.org>; Thu, 26 May 2022 08:16:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c7YI_XKZVEPW for <iommu@lists.linux-foundation.org>;
 Thu, 26 May 2022 08:16:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com
 [IPv6:2607:f8b0:4864:20::1149])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 524836130D
 for <iommu@lists.linux-foundation.org>; Thu, 26 May 2022 08:16:09 +0000 (UTC)
Received: by mail-yw1-x1149.google.com with SMTP id
 00721157ae682-3003a38c8f5so7127767b3.21
 for <iommu@lists.linux-foundation.org>; Thu, 26 May 2022 01:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=5GHBoFboCsQPgW0xnX8626mjCMc2pUtGqVQ4b897WKc=;
 b=IrILs6/SrbLE4LxEZxNKCm/JFj6eee7zIC+Pzx0k28blExnst8p510N+Mrt6f7Ati/
 fhCLg+kIuoSBGxRzYVVkBrn63L8QzTnZkJYc+jKZnJm5JNaCL1XmmvYBctVPcR+qBS4Q
 4wGC14+pYhcdcXPlJ8KKsOY776WVCqrKd5R2mTvBd9JNSJx0gAZsEcqFNfNjwN61LpwP
 wY12x1+QnyJW06iCpgYiPtLxT3ic3L0/CM/Hl9WavuWnDT7UzG67QuvgYRK2zzxRr467
 x76TkjjCfbOV/OiKelBwG+ZZI+ODSVX9nCHAb3bfLDYI4sagD3QOzDplraPR35J1ch4q
 W9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=5GHBoFboCsQPgW0xnX8626mjCMc2pUtGqVQ4b897WKc=;
 b=dBqowBtPq0JqkziE5Lf3NI/ta3bAnU652LCv1gCaKE7OeRIqML8Fn2Sjs0Usr2uYsS
 r5pTf03vMyrd2r9O//wHz9odqrig84BcK0EHK8KQNPGbfOJ0BYGay7uL7JT9LuW/JIGS
 i/QbXrCQ5Px+t0dSQ8neLdrsXA/VghzPN3u5jV5uwLvfSvBX9ju+EMnXIXcFQFCOmmNz
 z0BoUQrdl+4KFsQoxzqdlSvGVXOAUVafktYZ4m9TF5bKfudQZnvskHwdcptx0sHm4zhw
 CGoX/840//dQ+hsNsfYchlZWaLHssfDZoRM13AZzwr++HbplyGGXlbzam2Yh4k42Fak+
 JGsQ==
X-Gm-Message-State: AOAM532frkbymB3aOPPn55avMxeO8wuMondmyPhseixEe1/eZ8xsyaAM
 T64EM7nob6S+tc+6RalA6qBbMgrwlvAKcL4=
X-Google-Smtp-Source: ABdhPJwfT06c9prMUark3SgFprxU4855waPyfG4Z17nnwU6nQsbeq/CDsaY7uVT4Uffa6yH95LJ8lA+usCDNGiw=
X-Received: from saravanak.san.corp.google.com
 ([2620:15c:2d:3:ff1f:a3b7:b6de:d30f])
 (user=saravanak job=sendgmr) by 2002:a25:8e08:0:b0:64d:b20e:bf73 with SMTP id
 p8-20020a258e08000000b0064db20ebf73mr34625441ybl.558.1653552968266; Thu, 26
 May 2022 01:16:08 -0700 (PDT)
Date: Thu, 26 May 2022 01:15:44 -0700
In-Reply-To: <20220526081550.1089805-1-saravanak@google.com>
Message-Id: <20220526081550.1089805-6-saravanak@google.com>
Mime-Version: 1.0
References: <20220526081550.1089805-1-saravanak@google.com>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
Subject: [RFC PATCH v1 5/9] driver core: Set fw_devlink.strict=1 by default
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Kevin Hilman <khilman@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
 Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, 
 David Ahern <dsahern@kernel.org>
Cc: Rob Herring <robh@kernel.org>, linux-acpi@vger.kernel.org,
 Saravana Kannan <saravanak@google.com>, linux-pm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, linux-gpio@vger.kernel.org,
 iommu@lists.linux-foundation.org, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, John Stultz <jstultz@google.com>,
 kernel-team@android.com, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
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

Now that deferred_probe_timeout is non-zero by default, fw_devlink will
never permanently block the probing of devices. It'll try its best to
probe the devices in the right order and then finally let devices probe
even if their suppliers don't have any drivers.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/base/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 7cd789c4985d..7672f23231c1 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1581,7 +1581,7 @@ static int __init fw_devlink_setup(char *arg)
 }
 early_param("fw_devlink", fw_devlink_setup);
 
-static bool fw_devlink_strict;
+static bool fw_devlink_strict = true;
 static int __init fw_devlink_strict_setup(char *arg)
 {
 	return strtobool(arg, &fw_devlink_strict);
-- 
2.36.1.124.g0e6072fb45-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
