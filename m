Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F702A9A60
	for <lists.iommu@lfdr.de>; Fri,  6 Nov 2020 18:06:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8AC17868F7;
	Fri,  6 Nov 2020 17:06:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X8CpS2bHlrua; Fri,  6 Nov 2020 17:06:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8530E86727;
	Fri,  6 Nov 2020 17:06:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66F4AC0889;
	Fri,  6 Nov 2020 17:06:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2FAF6C0889
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 17:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 15CEF2E11D
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 17:06:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5NZxQmqEObfu for <iommu@lists.linux-foundation.org>;
 Fri,  6 Nov 2020 17:06:13 +0000 (UTC)
X-Greylist: delayed 00:27:35 by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by silver.osuosl.org (Postfix) with ESMTPS id BBB1C2E0E7
 for <iommu@lists.linux-foundation.org>; Fri,  6 Nov 2020 17:06:13 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id v11so851531qtq.12
 for <iommu@lists.linux-foundation.org>; Fri, 06 Nov 2020 09:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l//k+DSsx34Nc1jx/NivWPrPdB1Y2U4G87NDV4sY8fM=;
 b=J+dH50Ir6c9uH6K2wDO7IcS4bmFe8lOV8q7+I16iVL9sjS3ctqlKrze3+q9Dn3fH/p
 RpMwzXUMrzNbJyPmx+TInGqyYah2NJUHYeomnGj+eemuaR379i/7d8r5X8giuFbGhR7y
 wrM6ajU8PG6oJDbIPQ9ERXxj/66peBmKJWpqMXvriAry6Z3WSgCMRWZe9tfZ3T9X9y9j
 QTQwPL+nomvaHWeZlEFoV04dF9gYsCCXTk8CeYNMv10M/BfwBV6pZXPdNV9t7LDRtRoO
 6lEJFo7vdOQFlmWWaJ8vZA+GtzvCwj4m3nO1x+NSb0nhaMaTJE3zVpMpDnJ4erK0/xQF
 ZzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l//k+DSsx34Nc1jx/NivWPrPdB1Y2U4G87NDV4sY8fM=;
 b=SXeK10WYVVJ+U5q7NKnsAwsZKkVuEob2+TdB9oJ2Wf+LNrrwFV/uwNY0hieXSXOTAD
 q42xn9kUHpNGeJKiRiODdKCkJuOW9r/1wNqLazztKR7+B9M1AIhGJv0wEATniojMVfQY
 IVJQWEAoSLQwt0vY3tLpYSaPwN+SCFGLhZXWP890GCIEeEivvvZLSmojxVzNu13dwmdY
 LAGREiCCqaDHyo/5wXJ21UaBygpCmqbL5VDdLykjhyLFAgQYX58gca3Fg+oq+ZtusFd6
 xA836q1Q5HVR0LbKwKui3tpKRkhMHsVvjRcun5dKss3I6wPWoGOgCzgiQTxmbiqml+8X
 Wf8Q==
X-Gm-Message-State: AOAM5314tH35EUFwBp0Dto7XTZ0tuapkF78PkrilNdKA5PmrkV3qPUhW
 vXlfoPJmBqY5Ooo08nvGqAwJuq8NTqotsdxPWug=
X-Google-Smtp-Source: ABdhPJxHUWgYZ4frcBST4WltJsrhWPJrimgJHKRjTXKm4KGGNoJ82BuMMEXhzlmb3W3E9MA/bng0Qg==
X-Received: by 2002:ac8:5748:: with SMTP id 8mr2284612qtx.114.1604680717401;
 Fri, 06 Nov 2020 08:38:37 -0800 (PST)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id s3sm860000qkj.27.2020.11.06.08.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 08:38:36 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 0/5] drm/msm: support for host-cached BOs
Date: Fri,  6 Nov 2020 11:34:29 -0500
Message-Id: <20201106163437.30836-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 "open list:DMA MAPPING HELPERS" <iommu@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawn.guo@linaro.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
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

This is to support cached and cached-coherent memory types in vulkan.

v2:
 - added patches 2/3 to enable using dma_ops_bypass
 - changed DRM_MSM_GEM_SYNC_CACHE patch to use dma_sync_sg_for_device()
   and dma_sync_sg_for_cpu(), and renamed sync flags.

Not sure I did the right thing with for the dma_ops_bypass part,
this is what I came up with reading the emails.

Jonathan Marek (5):
  drm/msm: add MSM_BO_CACHED_COHERENT
  dma-direct: add dma_direct_bypass() to force direct ops
  drm/msm: call dma_direct_bypass()
  drm/msm: add DRM_MSM_GEM_SYNC_CACHE for non-coherent cache maintenance
  drm/msm: bump up the uapi version

 drivers/gpu/drm/msm/Kconfig                |  1 +
 drivers/gpu/drm/msm/adreno/adreno_device.c |  1 +
 drivers/gpu/drm/msm/msm_drv.c              | 32 +++++++++++++++++++---
 drivers/gpu/drm/msm/msm_drv.h              |  3 ++
 drivers/gpu/drm/msm/msm_gem.c              | 31 +++++++++++++++++++++
 include/linux/dma-direct.h                 |  9 ++++++
 include/uapi/drm/msm_drm.h                 | 25 +++++++++++++++--
 kernel/dma/direct.c                        | 23 ++++++++++++++++
 8 files changed, 118 insertions(+), 7 deletions(-)

-- 
2.26.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
