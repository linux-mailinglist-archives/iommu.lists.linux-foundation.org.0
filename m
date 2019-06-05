Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B16DF36653
	for <lists.iommu@lfdr.de>; Wed,  5 Jun 2019 23:09:05 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2B233D97;
	Wed,  5 Jun 2019 21:09:03 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6CF75D7A
	for <iommu@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 21:09:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0C76984C
	for <iommu@lists.linux-foundation.org>;
	Wed,  5 Jun 2019 21:09:00 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id d21so9666plr.3
	for <iommu@lists.linux-foundation.org>;
	Wed, 05 Jun 2019 14:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=4SOiYMPDMgMZV+MKOdKKhmpmtWM686pXbSZfXaXr6YQ=;
	b=Mi6HXX0anhGF/fyVD0TJ+rBoU8+/2sV4/6KT+SaA6jNtJ9nkggp1lNuo0OuYCkFXOf
	UAKAU5OaYgB3G/z4dWJRiAxPtXuTAqQ823ljiGWmob2ec6SBKGrnOC00mjXuGJ3w9Bma
	5Qqp+z5ebZgLLFm+vUUbZihDioWTGxweObsUb42AoVL+YQqqR9HUYKD+t6Pa158pertg
	ysierxBI6v9s7hTE0eAAaDfUmYePAKY9t34sOdNWUs4QctWbXrb1aXzCBWG0eEtuOENn
	eWoj7rcX5OJIugbTFOwwDFUVKaZAI0nhwoRRcFn01hfhuL2MtkcOFcHcn0WVHzAgUyMM
	CnfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=4SOiYMPDMgMZV+MKOdKKhmpmtWM686pXbSZfXaXr6YQ=;
	b=pTE4MWrKRU7a8H4vwoMx5pr239kEa5onAP15u1II6YZjg9NmzFVtJI5LMLtgWg3gzS
	n430M1xSEFOB8eZbv1CqgvFse/SiznJuIEF0AUYwvvclmrgc6wwCmaM2qmDUBVx0IYlh
	guQWzJJlPZsoQ+ULvPrHvK9I97ijxnDCTgd0PWHK1QEvqHxikWMYrN1dHC3i3IUEs5PB
	Gu/RIo63twjVJJazrEmOgzZymlh60WwKocsXxcwXxynR1pbZOzoEgo79uJX5G6XsZdbI
	9+x3leKDBMqJIUm+fE/UhYPi50IgpClesuFS+BYlxlxCoZN420CzWMkvIZPxwlYK6pxW
	9aYg==
X-Gm-Message-State: APjAAAVKVTLna7O/9k/Bc73RUlAEoDP3X/2V5dOVmSUaZExqd+Y8mPQ4
	vpc6Zc4M+aPHV0qG/Yw0wEY8Xg==
X-Google-Smtp-Source: APXvYqwvnaLGrRNt08GZmLk1bVNYK0cJLbYNoDQLhW3tjkGB1XdAbGb6FXGdS+HlXb7YWYAHFwIjNg==
X-Received: by 2002:a17:902:e85:: with SMTP id 5mr7578262plx.202.1559768939617;
	Wed, 05 Jun 2019 14:08:59 -0700 (PDT)
Received: from localhost.localdomain
	(104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
	by smtp.gmail.com with ESMTPSA id
	z68sm5093374pfb.37.2019.06.05.14.08.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Jun 2019 14:08:58 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will.deacon@arm.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [RFC 0/2] iommu: arm-smmu: Inherit SMR and CB config during init
Date: Wed,  5 Jun 2019 14:08:54 -0700
Message-Id: <20190605210856.20677-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.18.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Patrick Daly <pdaly@codeaurora.org>, Jeffrey Hugo <jhugo@codeaurora.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Qualcomm devices typically boot with some sort of splash screen on the display,
or for some devices (i.e. recent Qualcomm laptops) an EFI framebuffer. For this
the bootloader allocates a static framebuffer, configures the display hardware
to output this on the display, sets up the SMMU for the display hardware and
jumps to the kernel.

But as the arm-smmu disables all SMRs the display hardware will no longer be
able to access the framebuffer and the result is that the device resets.

The given proposal reads back the SMR state at boot and for marks these
contexts as busy. This ensures that the display hardware will have continued
access to the framebuffer. Once a device is attached we try to match it to the
predefined stream mapping, so that e.g. the display driver will inherit the
particular SMRs/CBs.


This has the positive side effect that on some Qualcomm platforms, e.g. QCS404,
writes to the SMR registers are ignored. But as we inherit the preconfigured
mapping from the bootloader we can use the arm-smmu driver on these platforms.

Bjorn Andersson (2):
  iommu: arm-smmu: Handoff SMR registers and context banks
  iommu: arm-smmu: Don't blindly use first SMR to calculate mask

 drivers/iommu/arm-smmu-regs.h |   2 +
 drivers/iommu/arm-smmu.c      | 100 +++++++++++++++++++++++++++++++---
 2 files changed, 93 insertions(+), 9 deletions(-)

-- 
2.18.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
