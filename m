Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id E31EF25E9EA
	for <lists.iommu@lfdr.de>; Sat,  5 Sep 2020 22:04:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 95A0F85F84;
	Sat,  5 Sep 2020 20:04:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vfvSYxh7G82x; Sat,  5 Sep 2020 20:04:02 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 99A3385CF2;
	Sat,  5 Sep 2020 20:04:02 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7C9AEC089E;
	Sat,  5 Sep 2020 20:04:02 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7F156C0051
 for <iommu@lists.linux-foundation.org>; Sat,  5 Sep 2020 20:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 68FCD86767
 for <iommu@lists.linux-foundation.org>; Sat,  5 Sep 2020 20:04:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pzYxoeFuzLsl for <iommu@lists.linux-foundation.org>;
 Sat,  5 Sep 2020 20:03:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 45BD3866FB
 for <iommu@lists.linux-foundation.org>; Sat,  5 Sep 2020 20:03:59 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id mm21so4749200pjb.4
 for <iommu@lists.linux-foundation.org>; Sat, 05 Sep 2020 13:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7KAgNczSpcXSENE7I7HLjPQLwLd/js6kuYT9gLzGMrc=;
 b=d8rJD/QaZSXKizO3GCu5CUpq+J4GmCJOqoR6otYkXn4kfaTkDvF+aBrkXOkT90Bahe
 ZbSkOQYq6ZHt/jSYiZ3sGkQoW5r8GXsXdrGnCpbeysVp5AkpCCH551tyZmse+AvyT80S
 CmH4MZF7sbeFiju6CPJrRnVWMfaBmOqcbDc66p6h+K6tCGvUGf/2pnZnvEJMjJhAKKI7
 UB3wdYStymMuX8KI39J4cj34r4fdCQ8rfL5aWLan9YNvn+yNYLhdNg0gWNkyIXBTWIDH
 r2ZxKWbLIg6aZAupdgaPn0TSs+gHDOfgVGHaUkRcGdCeOhyXiOtqGmK65todtAXFGtJd
 CuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7KAgNczSpcXSENE7I7HLjPQLwLd/js6kuYT9gLzGMrc=;
 b=ouUF7mSYN0HYeehVCDhQh1W2XPX4upm3zbmXC1RDPnLCoFybADGmATlTgmx7bqRzIl
 1tCcVinl4PHGUTOxsSiA31kxaUNmwu9DI08mk985YYVSeOO3MLQnhBNZHkWw0NOOieTS
 LzZbWtVTmIFbTvsz9zFwXkDDQU1pOELScAdcmFFIS+OozZK70+Y/M6Wbza2dQSHptdOL
 xZaQ/EP4vbcyKbRxs0or53gZUvDQmsywojLMwQQbP3zXFsA91cl5eFuEhTOGE0Fd7Kcz
 ZG9e4BRYSMkjB2GUm/1lDPSzUT4dB5U5j+QvC21g+bqOkX6P3flsDsX7Ijm46bGGrV/X
 nw3A==
X-Gm-Message-State: AOAM531qYGEft7qjYLNmb1UiFUTbtgG5obbfdrlThmnZlo3Q/W0ac/Cs
 S64DEkSvt3YEsmuszcAxuom9TMVIj6zev/ud
X-Google-Smtp-Source: ABdhPJxokmd9eJn1r0GSTZtkg2Dhgd5Wg4QvyB1tZpQEqAEv9hOMzQ9O0ygy2PRwuew2h0245PkdCg==
X-Received: by 2002:a17:90a:19c2:: with SMTP id 2mr13380689pjj.6.1599336238220; 
 Sat, 05 Sep 2020 13:03:58 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 k4sm11254400pfp.189.2020.09.05.13.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 13:03:57 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>
Subject: [PATCH v17 01/20] drm/msm: Remove dangling submitqueue references
Date: Sat,  5 Sep 2020 13:04:07 -0700
Message-Id: <20200905200454.240929-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200905200454.240929-1-robdclark@gmail.com>
References: <20200905200454.240929-1-robdclark@gmail.com>
MIME-Version: 1.0
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Akhil P Oommen <akhilpo@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, freedreno@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

From: Rob Clark <robdclark@chromium.org>

Currently it doesn't matter, since we free the ctx immediately.  But
when we start refcnt'ing the ctx, we don't want old dangling list
entries to hang around.

Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/msm_submitqueue.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
index a1d94be7883a..90c9d84e6155 100644
--- a/drivers/gpu/drm/msm/msm_submitqueue.c
+++ b/drivers/gpu/drm/msm/msm_submitqueue.c
@@ -49,8 +49,10 @@ void msm_submitqueue_close(struct msm_file_private *ctx)
 	 * No lock needed in close and there won't
 	 * be any more user ioctls coming our way
 	 */
-	list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node)
+	list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node) {
+		list_del(&entry->node);
 		msm_submitqueue_put(entry);
+	}
 }
 
 int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
