Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C41EC1D9EA7
	for <lists.iommu@lfdr.de>; Tue, 19 May 2020 20:02:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9819F23337;
	Tue, 19 May 2020 18:02:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J+bD82VJVbyI; Tue, 19 May 2020 18:02:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DCBA723235;
	Tue, 19 May 2020 18:02:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C7E64C0176;
	Tue, 19 May 2020 18:02:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D17A3C0176
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 18:02:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C3F1D88882
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 18:02:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A3ULzhbNSfeX for <iommu@lists.linux-foundation.org>;
 Tue, 19 May 2020 18:02:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id F229E88894
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 18:02:06 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id e16so394894wra.7
 for <iommu@lists.linux-foundation.org>; Tue, 19 May 2020 11:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dZJbr50yu+A1rXxxZjmC6b+njrvRrh11YfdOdR6ZavM=;
 b=vNeBBYBtO1MlCmDZi2omuq7p6WTCEFIBil9Pkec1SF9TMZYl+5lkItE0NF2u/qYIuQ
 lmiLB2BA7h9SazxYMZa9UBVoHEOQr4wCAHMfevxQ9L1X/+IrzF+9AJDv4i0tTWPDAPTj
 R24F/zikAzERUXO99pzh2SbcaRuLVAJVylsiMvyzYXlDXzVD7qdGPxLdrArZ2a9Fa0DD
 tJ4iYGE24E6fSgpJoDafwrRiS6x7MHRLQZhCqeikxTta1o4hPuWTzr3g6mQNeLPJGu1P
 XJaUy1uTviXVQiXLA23Ad5Y8iT2b7HJYh1gU9tQqZgCnMpA2o1xg9WrZMzpMIeAczTQ/
 oNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dZJbr50yu+A1rXxxZjmC6b+njrvRrh11YfdOdR6ZavM=;
 b=U2rNgMPlWwivHmVgFg1m85ixgVUmaTvG3pJ1Crkl6+CWjg74sdDlVhRCwcdkNGaNri
 MXmf6pua/C5xM24IBICrzepUVndElvtG/CyJiNsknWRg3oMXFR0okOm160avm4AgeZNZ
 b2lhyh6iqaOuApgH9WSa6u8nvAFL+lE+0sFkVBPTTxlKzN64qXqWCEQnj0vH7jbEKGJZ
 DlVnsUyIHD84DdUp70ZX/wKUU2z3aRxijAZdXlwz9bEkHSdhp1+IhdhmwS6Vyej2Zda4
 v4qFnnEBfGh2MzcagnwxQMX7ZjpmbwfrKGc6xwj72ueAvfqIgLiA3qysZJq72b86Vz8e
 JJIQ==
X-Gm-Message-State: AOAM533/7h9jXZDBx/K4PqN5G/av3h1/uBOmVcbdBy8Uod8vAFpTh2U7
 6dxiNsQuPn9eDHR7sMTKFY239vVOwwYuEA==
X-Google-Smtp-Source: ABdhPJwT8Eq7gpqVQWpnFuRyfkFTyMRHoxv//ACSK89NpoGnC1siz7BSfxh+oXZVDA+VgnaA+xgUGA==
X-Received: by 2002:a5d:6108:: with SMTP id v8mr109324wrt.286.1589911325064;
 Tue, 19 May 2020 11:02:05 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:171b:226e:c200:c43b:ef78:d083:b355])
 by smtp.gmail.com with ESMTPSA id 1sm510496wmz.13.2020.05.19.11.02.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 11:02:04 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-mm@kvack.org
Subject: [PATCH v7 20/24] dt-bindings: document stall property for IOMMU
 masters
Date: Tue, 19 May 2020 19:54:58 +0200
Message-Id: <20200519175502.2504091-21-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200519175502.2504091-1-jean-philippe@linaro.org>
References: <20200519175502.2504091-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: Rob Herring <robh@kernel.org>, fenghua.yu@intel.com, kevin.tian@intel.com,
 jgg@ziepe.ca, catalin.marinas@arm.com, robin.murphy@arm.com, hch@infradead.org,
 zhangfei.gao@linaro.org, Jean-Philippe Brucker <jean-philippe@linaro.org>,
 felix.kuehling@amd.com, will@kernel.org, christian.koenig@amd.com
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

On ARM systems, some platform devices behind an IOMMU may support stall,
which is the ability to recover from page faults. Let the firmware tell us
when a device supports stall.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 .../devicetree/bindings/iommu/iommu.txt        | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/iommu.txt b/Documentation/devicetree/bindings/iommu/iommu.txt
index 3c36334e4f94..26ba9e530f13 100644
--- a/Documentation/devicetree/bindings/iommu/iommu.txt
+++ b/Documentation/devicetree/bindings/iommu/iommu.txt
@@ -92,6 +92,24 @@ Optional properties:
   tagging DMA transactions with an address space identifier. By default,
   this is 0, which means that the device only has one address space.
 
+- dma-can-stall: When present, the master can wait for a transaction to
+  complete for an indefinite amount of time. Upon translation fault some
+  IOMMUs, instead of aborting the translation immediately, may first
+  notify the driver and keep the transaction in flight. This allows the OS
+  to inspect the fault and, for example, make physical pages resident
+  before updating the mappings and completing the transaction. Such IOMMU
+  accepts a limited number of simultaneous stalled transactions before
+  having to either put back-pressure on the master, or abort new faulting
+  transactions.
+
+  Firmware has to opt-in stalling, because most buses and masters don't
+  support it. In particular it isn't compatible with PCI, where
+  transactions have to complete before a time limit. More generally it
+  won't work in systems and masters that haven't been designed for
+  stalling. For example the OS, in order to handle a stalled transaction,
+  may attempt to retrieve pages from secondary storage in a stalled
+  domain, leading to a deadlock.
+
 
 Notes:
 ======
-- 
2.26.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
