Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B44D539DBA
	for <lists.iommu@lfdr.de>; Wed,  1 Jun 2022 09:07:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05D8C81470;
	Wed,  1 Jun 2022 07:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8F3IBh2BXuxc; Wed,  1 Jun 2022 07:07:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 370C68151E;
	Wed,  1 Jun 2022 07:07:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EE9F2C002D;
	Wed,  1 Jun 2022 07:07:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2DDAC002D
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 07:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E177760AA3
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 07:07:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=google.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UIgMR5cYUV_Y for <iommu@lists.linux-foundation.org>;
 Wed,  1 Jun 2022 07:07:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CECC60E86
 for <iommu@lists.linux-foundation.org>; Wed,  1 Jun 2022 07:07:36 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 j11-20020a05690212cb00b006454988d225so716919ybu.10
 for <iommu@lists.linux-foundation.org>; Wed, 01 Jun 2022 00:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=ieoVojKSMClytLuQ+M5eO4VEou/nUlDXxOmFZvVOEG4=;
 b=o1NgvjMPh9PX/sOxZuAomHF5SvSarttRyUSV3kNkszadpGlu1uv6IEIjpGGDSAjniU
 E+y2y2wqIU4315xblR8C6Asgjg6o+j6pIfl3cWTp5f6IIF8NSWAIG/pQjRNIrVGQWK7u
 bzAAetgfksHssMKIVk0hlZADR3xdCXjBT8vitK2WoFnP2URYF0j2EP1rZoglOShrtvyc
 qAmvvhmnvASj9V9HiH5wLl89R+mdMxkBbulwCtyo+WdMxZ3Z/DsCo3A3fxYxfN42mW3a
 VAxw0DcJTPmpGr9QH/1qpkX+NneJ0635SNXlJEe3vHn5G8/WiRW8ZSO9HaJRlXugDi6q
 shTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=ieoVojKSMClytLuQ+M5eO4VEou/nUlDXxOmFZvVOEG4=;
 b=x0eCpI/olpqmfPEl/nRqUxsdtOK1ph+AzxvWiyE8uvpMkROe38boRomYtPHd0oOc/s
 HefrqqEB+hFdthXDfOi3Jrsg1kz9AZjHHK6GL/ixIZGRei/O+zSnBdsK7uaJm+bELGPv
 TeimhBWq/WhV422mKMK9YZzuc9YqeFwvH0XlnmyHRei21ODJOEGHQP6CMhUYuRHiYQzk
 yBb0IZKT/rbee74yTmfQfUExBRVkU/gI9JjyxAlVmVkH+y3L2RyBOS64MaKj8gW8H8/2
 NIcsd9icjtQ3Rz1F9zPSdprSCDCOd7J8jgHh0Yf5bv9NvSRmvdhiaNH2jvBS7WkuaidN
 +HHQ==
X-Gm-Message-State: AOAM533H6vO/X2KDtFZv4WJlOuHqOgMqdl8CYAQblh1rBrEtyMYuCdw4
 8dQUSs944kJCORU/3fgP46sMnKE8iZSdVc0=
X-Google-Smtp-Source: ABdhPJwf9glz1eZgtG02b9iYSiXC0SdBQLNg/Oicnn+CPlVJJtTU1MQH2shYhTd2HU+NOooR1foe3NkSdi1e0Oo=
X-Received: from saravanak.san.corp.google.com
 ([2620:15c:2d:3:f3aa:cafe:c20a:e136])
 (user=saravanak job=sendgmr) by 2002:a25:c884:0:b0:655:f0bf:9da4 with SMTP id
 y126-20020a25c884000000b00655f0bf9da4mr34185430ybf.468.1654067255211; Wed, 01
 Jun 2022 00:07:35 -0700 (PDT)
Date: Wed,  1 Jun 2022 00:07:04 -0700
In-Reply-To: <20220601070707.3946847-1-saravanak@google.com>
Message-Id: <20220601070707.3946847-9-saravanak@google.com>
Mime-Version: 1.0
References: <20220601070707.3946847-1-saravanak@google.com>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
Subject: [PATCH v2 8/9] iommu/of: Delete usage of
 driver_deferred_probe_check_state()
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

Now that fw_devlink=on and fw_devlink.strict=1 by default and fw_devlink
supports iommu DT properties, the execution will never get to the point
where driver_deferred_probe_check_state() is called before the supplier
has probed successfully or before deferred probe timeout has expired.

So, delete the call and replace it with -ENODEV.

Signed-off-by: Saravana Kannan <saravanak@google.com>
---
 drivers/iommu/of_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 5696314ae69e..41f4eb005219 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -40,7 +40,7 @@ static int of_iommu_xlate(struct device *dev,
 	 * a proper probe-ordering dependency mechanism in future.
 	 */
 	if (!ops)
-		return driver_deferred_probe_check_state(dev);
+		return -ENODEV;
 
 	if (!try_module_get(ops->owner))
 		return -ENODEV;
-- 
2.36.1.255.ge46751e96f-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
