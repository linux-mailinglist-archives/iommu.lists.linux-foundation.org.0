Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F0F1FA88F
	for <lists.iommu@lfdr.de>; Tue, 16 Jun 2020 08:13:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id B0FB988CB8;
	Tue, 16 Jun 2020 06:13:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0REA+2mux7Wh; Tue, 16 Jun 2020 06:13:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4803D88CC7;
	Tue, 16 Jun 2020 06:13:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2C074C016E;
	Tue, 16 Jun 2020 06:13:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 87FF0C016E
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 06:13:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 700B388495
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 06:13:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qv8+5WHJ-Pdn for <iommu@lists.linux-foundation.org>;
 Tue, 16 Jun 2020 06:13:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id D57A1882AB
 for <iommu@lists.linux-foundation.org>; Tue, 16 Jun 2020 06:13:42 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id d8so7911735plo.12
 for <iommu@lists.linux-foundation.org>; Mon, 15 Jun 2020 23:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=WpLd8LRsJ/8biRJMZx0Bnx3mOD9worHTt50kQ8XWP7E=;
 b=RxSooEOC/+yMUfI3gtNEWymtFFdmRe4Tkk2rBTpKJA3oVwp3ItlbonH5UnISC/UFSw
 xg7h20PlIep3H7ldLpXzMVsTTCtf/6qdsD2rtzER8gSccQuO5izUvI4/DVOJyuBr0uup
 P8aGCybW+GqHvl6l/YXJECQASVAnBVyQ/gMEygwAhcntyylCrDU5piUvOROASQrJULJ3
 xo1aXzo0HfZYEWVbNFb3YdWACmXm/8ZRtF59TQz1J9nEEG1zyL1wVX2++p/L/AMY9SsH
 hIm8Cg3VHPQyhCvqGwz5j4gSPvFKc8dSujV/RvR9zDWeHStJ0IPk46rRwp3VvwGDargX
 TGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WpLd8LRsJ/8biRJMZx0Bnx3mOD9worHTt50kQ8XWP7E=;
 b=UFfL7JgKX+M6Wb7XYKDsHmr8z4CeP80bsjMdli/Q/YZni5kw7yQVCBDZH4snfjuhpN
 w2khNzf7f/AP+ueE32e/xwt5++xyqBbmcOKs6dv6GtW87AQgAqfsD0oayK/InGYg7jCt
 gyVGNNXsBRTlKfONWCoZYe8kS/L4z652d7XCSAy40WyV7Wcy4y55rxSWD4FwVS4e5L+r
 K8doTGtyc6FrMJKQ4rE1e1IT96Znx+++H1zNUSPMHquxUv0U+zcVUETWxq+Iz2kfq8AU
 tTOkvOug5MM5k89LD14egW2U0bODhNbVZTXuBmQXR7XnHjnt2LKgIMHK1CXuqMtDUl6q
 DjcA==
X-Gm-Message-State: AOAM532/mwR7608CohRramgkdctFjmKfQQaeKpdekluAo4FjXAH9pVpk
 fX+FBbPoXtPuTH30xlsfo8NXuw==
X-Google-Smtp-Source: ABdhPJxJYRDBUdC2n/hzHBEEXJUuOgq+LjZinVw+29cwU9skb8cP3yPF9qx0n2GXzlPlzYv9r0itoQ==
X-Received: by 2002:a17:90b:28d:: with SMTP id
 az13mr1345731pjb.67.1592288022378; 
 Mon, 15 Jun 2020 23:13:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 i26sm15642032pfo.0.2020.06.15.23.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 23:13:41 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RFC][PATCH 0/5] Allow for qcom-pdc,
 pinctrl-msm and qcom-scm drivers to be loadable as modules
Date: Tue, 16 Jun 2020 06:13:33 +0000
Message-Id: <20200616061338.109499-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
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

This patch series provides exports and config tweaks to allow
the qcom-pdc, pinctrl-msm and qcom-scm drivers to be able to be
configured as permement modules (particularlly useful for the
Android Generic Kernel Image efforts).

Feedback would be appreciated!

thanks
-john

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

John Stultz (5):
  irq: irqdomain: Export irq_domain_update_bus_token
  irq: irqchip: Export irq_chip_retrigger_hierarchy and
    irq_chip_set_vcpu_affinity_parent
  irqchip: Allow QCOM_PDC to be loadable as a perment module
  pinctrl: qcom: Allow pinctrl-msm code to be loadable as a module
  firmware: QCOM_SCM: Allow qcom_scm driver to be loadable as a
    permenent module

 drivers/firmware/Kconfig           |  2 +-
 drivers/firmware/Makefile          |  3 ++-
 drivers/firmware/qcom_scm.c        |  4 ++++
 drivers/iommu/Kconfig              |  2 ++
 drivers/irqchip/Kconfig            |  2 +-
 drivers/irqchip/qcom-pdc.c         | 30 ++++++++++++++++++++++++++++++
 drivers/pinctrl/qcom/Kconfig       |  2 +-
 drivers/pinctrl/qcom/pinctrl-msm.c |  3 +++
 kernel/irq/chip.c                  |  3 ++-
 kernel/irq/irqdomain.c             |  1 +
 10 files changed, 47 insertions(+), 5 deletions(-)

-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
