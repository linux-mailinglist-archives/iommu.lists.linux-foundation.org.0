Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id 9495049558B
	for <lists.iommu@lfdr.de>; Thu, 20 Jan 2022 21:42:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23178404F6;
	Thu, 20 Jan 2022 20:42:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JLSVhq-Sy_J4; Thu, 20 Jan 2022 20:42:10 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CAAF240574;
	Thu, 20 Jan 2022 20:42:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63D9CC0077;
	Thu, 20 Jan 2022 20:42:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 37089C002F
 for <iommu@lists.linux-foundation.org>; Thu, 20 Jan 2022 20:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16B4941644
 for <iommu@lists.linux-foundation.org>; Thu, 20 Jan 2022 20:20:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UiFgV_YjnOvX for <iommu@lists.linux-foundation.org>;
 Thu, 20 Jan 2022 20:20:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57106414CD
 for <iommu@lists.linux-foundation.org>; Thu, 20 Jan 2022 20:20:02 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id m3so26247298lfu.0
 for <iommu@lists.linux-foundation.org>; Thu, 20 Jan 2022 12:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SV2+kbDgVtw0lV31uGNVO0MZ2UY0VfBryzePxW9RfDo=;
 b=hjq4AM/+aWwjiHOTI1IslNvdQgEv7Wbun6S6h7xb8cEm5+1TLN/d0WYqA/mc6RvKNN
 gQoe6LKKSpfjOZLCLTLw4Trrwoy5pXt9ZXEhM1B1luwTPNTaZHvZvecumQPBw/nPJ8Vb
 ENXUAiSZ2tztrL1y2h31ulq2bhNPSHGHa5MWThKCSMSusMuK0rbzEQpVlpSLdzHb6Bpk
 FmouJtfAYUYKVnFOUw5o0tObrSmDtyx8Zst5xGxBpe6NhnhpFeLs+PX4HmQJsf0jHfK7
 yOZ9Wp7UrHJmxsXvIXLkY3xAI4Thzz/XA+rA0ufps2f8KuC/1LSFCNNgdMYPwAWozk0B
 8qMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SV2+kbDgVtw0lV31uGNVO0MZ2UY0VfBryzePxW9RfDo=;
 b=kJ7MCkmUuDfJqSLcLSnBQSkDaBaXfkLOCUgkbnm3NDZJ4SWvxZIOOZV8P2KIHBcNNk
 JGJJpj4xnGKjkZq76F4igLfPkwNYwQ0cGzMBzf5jMFSciqr37hdTfLk6M8SuQZK3fVWZ
 Tck+meCqgkAslO3bRJTuB7rWZp/f5YtPnBU+qGY8oHQ09bAMpIaWSptV2B32UEZvpm3P
 MpyHT7sdCLZOVFP7rJB7q+xEILCuzHT81+dBla3cwGpnHbP9kJaSGmh4xNr2YIsDb37J
 uXqlB2/yqkvC3Rx2BjZTGr2dsztd0m+/jrY44N6YN6SWVa2V2fhba4mzuV+SDZdeOG8J
 3tCA==
X-Gm-Message-State: AOAM532OXwQYp0OIeu+Tll6eiDSPE1+4PKAVOBKPYzAeXLLptn8emugK
 zCmrGeXscc8h20REp+gRnY4lqA==
X-Google-Smtp-Source: ABdhPJxE6MkmquotwQB0ocKSKdWoDh5ulhRTbJKLE+X/Kg/iQUIIWJNEWpJYx5Uhrcqz6/tpYGTFTw==
X-Received: by 2002:a05:651c:511:: with SMTP id
 o17mr559195ljp.435.1642709999939; 
 Thu, 20 Jan 2022 12:19:59 -0800 (PST)
Received: from localhost ([31.134.121.151])
 by smtp.gmail.com with ESMTPSA id q17sm21155lfb.271.2022.01.20.12.19.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 12:19:59 -0800 (PST)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [RFC 0/3] iommu/samsung: Introduce Exynos sysmmu-v8 driver
Date: Thu, 20 Jan 2022 22:19:55 +0200
Message-Id: <20220120201958.2649-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Jan 2022 20:42:08 +0000
Cc: Janghyuck Kim <janghyuck.kim@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Carlos Llamas <cmllamas@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-samsung-soc@vger.kernel.org,
 Mark Salyzyn <salyzyn@google.com>, Jinkyu Yang <jinkyu1.yang@samsung.com>,
 Thierry Strudel <tstrudel@google.com>, Will McVicker <willmcvicker@google.com>,
 Cho KyongHo <pullip.cho@samsung.com>, linux-arm-kernel@lists.infradead.org,
 Jonglin Lee <jonglin@google.com>, "J . Avila" <elavila@google.com>,
 Alex <acnwigwe@google.com>, linux-kernel@vger.kernel.org,
 Hyesoo Yu <hyesoo.yu@samsung.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
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

This is a draft of a new IOMMU driver used in modern Exynos SoCs (like
Exynos850) and Google's GS101 SoC (used in Pixel 6 phone). Most of its
code were taken from GS101 downstream kernel [1], with some extra
patches on top (fixes from Exynos850 downstream kernel and some porting
changes to adapt it to the mainline kernel). All development history can
be found at [2].

Similarities with existing exynos-iommu.c is minimal. I did some
analysis using similarity-tester tool:

8<-------------------------------------------------------------------->8
    $ sim_c -peu -S exynos-iommu.c "|" samsung-*

    exynos-iommu.c consists for 15 % of samsung-iommu.c material
    exynos-iommu.c consists for 1 %  of samsung-iommu-fault.c material
    exynos-iommu.c consists for 3 %  of samsung-iommu.h material
8<-------------------------------------------------------------------->8

So the similarity is very low, most of that code is some boilerplate
that shouldn't be extracted to common code (like allocating the memory
and requesting clocks/interrupts in probe function).

It was tested on v5.4 Android kernel on Exynos850 (E850-96 board) with
DPU use-case (displaying some graphics to the screen). Also it
apparently works fine on v5.10 GS101 kernel (on Pixel 6). On mainline
kernel I managed to build, match and bind the driver. No real world test
was done, but the changes from v5.10 (where it works fine) are minimal
(see [2] for details). So I'm pretty sure the driver is functional.

For this patch series I'd like to receive some high-level review for
driver's design and architecture. Coding style and API issues I can fix
later, when sending real (not RFC) series. Particularly I'd like to hear
some opinions about:
  - namings: Kconfig option, file names, module name, compatible, etc
  - modularity: should this driver be a different platform driver (like
    in this series), or should it be integrated into existing
    exynos-iommu.c driver somehow
  - dt-bindings: does it look ok as it is, or some interface changes are
    needed
  - internal driver architecture: approach seems to be similar to
    exynos-iommu.c, but any comments are welcome
  - ongoing work: please let me know if you're aware of some efforts to
    upstream this driver by some other party (e.g. Google engineers
    might be working on something similar)

Basically, I want to figure out what should be changed/fixed in this
driver (on a high level), so it can be considered "upstreamable".

[1] https://android.googlesource.com/kernel/gs/
[2] https://github.com/joe-skb7/linux/commits/iommu-exynos850-dev

Sam Protsenko (3):
  dt-bindings: iommu: Add bindings for samsung,sysmmu-v8
  iommu/samsung: Introduce Exynos sysmmu-v8 driver
  arm64: defconfig: Enable sysmmu-v8 IOMMU

 .../bindings/iommu/samsung,sysmmu-v8.txt      |   31 +
 arch/arm64/configs/defconfig                  |    2 +
 drivers/iommu/Kconfig                         |   13 +
 drivers/iommu/Makefile                        |    3 +
 drivers/iommu/samsung-iommu-fault.c           |  617 +++++++
 drivers/iommu/samsung-iommu-group.c           |   50 +
 drivers/iommu/samsung-iommu.c                 | 1521 +++++++++++++++++
 drivers/iommu/samsung-iommu.h                 |  216 +++
 include/dt-bindings/soc/samsung,sysmmu-v8.h   |   43 +
 9 files changed, 2496 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iommu/samsung,sysmmu-v8.txt
 create mode 100644 drivers/iommu/samsung-iommu-fault.c
 create mode 100644 drivers/iommu/samsung-iommu-group.c
 create mode 100644 drivers/iommu/samsung-iommu.c
 create mode 100644 drivers/iommu/samsung-iommu.h
 create mode 100644 include/dt-bindings/soc/samsung,sysmmu-v8.h

-- 
2.30.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
