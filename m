Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 534E7391CED
	for <lists.iommu@lfdr.de>; Wed, 26 May 2021 18:21:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF69C402A0;
	Wed, 26 May 2021 16:21:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5wX6bck8w33S; Wed, 26 May 2021 16:21:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F8044063E;
	Wed, 26 May 2021 16:21:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CCA04C0028;
	Wed, 26 May 2021 16:21:39 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E92EDC000E
 for <iommu@lists.linux-foundation.org>; Wed, 26 May 2021 16:21:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D445E60AEF
 for <iommu@lists.linux-foundation.org>; Wed, 26 May 2021 16:21:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2aQYA6y_GW9V for <iommu@lists.linux-foundation.org>;
 Wed, 26 May 2021 16:21:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B6559608BC
 for <iommu@lists.linux-foundation.org>; Wed, 26 May 2021 16:21:35 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id lg14so3353344ejb.9
 for <iommu@lists.linux-foundation.org>; Wed, 26 May 2021 09:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ny/LVTZ9NhT7pAThv8EZzNISFLoNH72249Lr1FcP2cI=;
 b=DiMkylxvByFm8pw9ICWMTsxJtAVMkIc1v+qhXw8MlH8NYoOQHZDzPwYhMKyf4zehcU
 9BNQZFb9m83eA/WivtK5JIiBd4CBiLu6jsxruJCx2FxqUBSHWfYIswDrkBbj34h8J23B
 lqaFT3E/HC7lRmeBzk+WxMIEH79wtIqeoj081sGiC3xbeyMQdgoLwp/s+UAvdIwYunwf
 wTgcqQL/RzXf19RnNXhRFRjvlFUb0SxOfGYi82FD8Wnwe3w584+pU+UxuUZaku/pGTrn
 C313eJUpAnO9OUiQrzvBZLWbGuT/2fXE9gNwjeJ7hJRd+C0onv7py91r2R+Mao66KI7F
 cjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ny/LVTZ9NhT7pAThv8EZzNISFLoNH72249Lr1FcP2cI=;
 b=nOwMRYVoHFIfzyk6bEr0JWSz3b1LJxf8RK3pfIQD9OJCFSoEiiHd1/mSO73J3cqLzm
 Q7nS+OwxcrzydCX+3yBQqP+/GJ0ILb1s+YyGy4wCkn7kbOYDkPnk63r3ykhwfYiwEaA4
 lDRy4I+D7I5JgzFI1RL1i8yxxXgo650yEMR73LmQpnyamUyzNFF+FSjvYcLtsfNFJa1L
 f3CupPoROY13MRVIpvANreJi1G47UZx+w8ED0YvU/tLc9m4mcZEqWjmMc6TegOxKOz1w
 950ClMB8gok57NOU5Mkrs5x9fX1hR48WmER0uHlfxWx9uT84Be1WZ0q4hC7UrwJ16Gtv
 1uEQ==
X-Gm-Message-State: AOAM533XOYmpXQxTYoKev5ePdzQw9vYDEkMQ8NzU+wl9WhBzkTJC5poC
 BHSrBJpnxjj1c4dSSn9VGzUVGQ==
X-Google-Smtp-Source: ABdhPJyqzgF1RD6CdwvK48ZfcwVE7vT+A0zVtv0WtiBKRWJwPQ1T58Q1HOYoySz9zdFZA/kfZFQwvw==
X-Received: by 2002:a17:906:a0a:: with SMTP id
 w10mr34330704ejf.416.1622046093908; 
 Wed, 26 May 2021 09:21:33 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-106-126.adslplus.ch.
 [84.226.106.126])
 by smtp.gmail.com with ESMTPSA id e6sm10497145ejd.31.2021.05.26.09.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 09:21:33 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v15 0/3] iommu/arm-smmu-v3: Add stall support
Date: Wed, 26 May 2021 18:19:25 +0200
Message-Id: <20210526161927.24268-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-acpi@vger.kernel.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, guohanjun@huawei.com,
 rjw@rjwysocki.net, iommu@lists.linux-foundation.org, robh+dt@kernel.org,
 sudeep.holla@arm.com, zhangfei.gao@linaro.org, robin.murphy@arm.com,
 linux-arm-kernel@lists.infradead.org, lenb@kernel.org
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

Add stall support for SMMUv3, enabling I/O page faults and SVA for
compatible devices. No change since last version [1], but I'd still like
this to be considered for upstream, because there exists hardware and
applications.

Stall is implemented by the Kunpeng 920 processor for its compression
and crypto accelerators, with which I tested the SVA infrastructure.
Using the userspace accelerator API [2], a program can obtain a queue
from one of these devices and submit compression or encryption work
within the program's address space. UADK [3] provides a library to do
this, and there is an openssl plugin [4] to use it.

That's probably as far as we can go in terms of real users of SVA at the
moment, since userspace won't progress much further without upstream
kernel support - these three patches.

Stall is only enabled if the firmware declares that the device supports
stalling (explicit flags from patches 1 and 2) or, in the case of the
Kunpeng 920, with a quirk [5]. If that property is not set, stall will
still be disabled in the STE and CD, and this series should not have any
negative impact on existing systems.

[1] https://lore.kernel.org/linux-iommu/20210401154718.307519-1-jean-philippe@linaro.org/
[2] Documentation/misc-devices/uacce.rst
[3] https://github.com/Linaro/uadk
[4] https://github.com/Linaro/openssl-uadk
[5] https://lore.kernel.org/linux-pci/1615258837-12189-1-git-send-email-zhangfei.gao@linaro.org/
    FWIW future devices should implement PRI:
    https://lore.kernel.org/linux-pci/5FD9EE6E.1040505@hisilicon.com/

Jean-Philippe Brucker (3):
  dt-bindings: document stall property for IOMMU masters
  ACPI/IORT: Enable stall support for platform devices
  iommu/arm-smmu-v3: Add stall support for platform devices

 .../devicetree/bindings/iommu/iommu.txt       |  18 ++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  43 ++++
 drivers/acpi/arm64/iort.c                     |   4 +-
 .../iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c   |  59 +++++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   | 196 +++++++++++++++++-
 5 files changed, 304 insertions(+), 16 deletions(-)

-- 
2.31.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
