Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5294428EEFC
	for <lists.iommu@lfdr.de>; Thu, 15 Oct 2020 11:03:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B355520450;
	Thu, 15 Oct 2020 09:02:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cE+cUGewfOj5; Thu, 15 Oct 2020 09:02:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 5E7532044F;
	Thu, 15 Oct 2020 09:02:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 42C05C0051;
	Thu, 15 Oct 2020 09:02:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 73CE9C0051
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 09:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4E4AD87BEB
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 09:02:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iJDwL0DN8-Gs for <iommu@lists.linux-foundation.org>;
 Thu, 15 Oct 2020 09:02:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4C82987B8B
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 09:02:54 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id p5so2528184ejj.2
 for <iommu@lists.linux-foundation.org>; Thu, 15 Oct 2020 02:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jwGwzOz2iwiJeRP/ODTx8CbVxZ1hxrUMfR1ipDCP90s=;
 b=qweI/BwrMtF9IhlcAGpBsKH85MRIVZxQma8KEMG7BfTWf1sz0mowzoiuCEvsJiixil
 bkRKKMFFSyK2XWQOdsx8jSzJT9/lrKRS4le4AsLPWoO6q+IMkXLp3VWsZ+AJcuWAWkH3
 QIPaDUVlIXNpUNL/iunpTS14GJOpoRjsyVmA9ZMWjqP7YhmRSebklA+Mj7flGYS49QQ8
 WuIZGIJpF/fNrgO2eEGZZHfV0lczFhw6ZiSwTk0QE2JmmGQg4UhQ6BoFzbJ8md/3mehH
 VI9891UG0SiycGRKXJB0BDJsAVwe0KcBTwmHK/xIsOiklJ2m9nv16cSWxYGIZwrhSpnH
 vJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jwGwzOz2iwiJeRP/ODTx8CbVxZ1hxrUMfR1ipDCP90s=;
 b=MT83xpigGbZDpLbuU4z3S2u0g1fFmmZ4QHrzNrZDd5cm7nqoE7yOV8v9AG+xVuFQQf
 YJ2pH3ntz7XxC/QuD5QUUm1aa/N9KmTJN+cc++9IGN61LTCuemtHe/TtdghkquixxnJ3
 OLfDd65bXJOwl/MCq7g6E+URlQBj5d7WCWBIcK8UF8nIZhDr2KbnB0cQ0yKK+mPpHaVJ
 JG4k6RsuPEnM29Y+KtawjNc00Wc75s4kR8qK6AgBsOcHvESGCWFzARpjAjNtqu86DY1c
 QVveYjULpKUM5f9IQ9qQewBKKomWO65Zcx3Io2ckwnfxf86CA2ulsoIel7yq31FwQ6qP
 1u2Q==
X-Gm-Message-State: AOAM532sqn8O/CBDCwWKDvOlnKVTfupl8e/Wb/WH4FHsk50SOpPfMnzB
 cuZ33z8jn9sfRVDFG3Pvp6tj5A==
X-Google-Smtp-Source: ABdhPJztgb5AXCuuQNTQ7o/iU4i1S0WhyHCR85sQNeGullTF/FIpxP8ZJsVHxqQduAeyDPWkNehDiQ==
X-Received: by 2002:a17:906:f90a:: with SMTP id
 lc10mr3439626ejb.272.1602752572593; 
 Thu, 15 Oct 2020 02:02:52 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id d12sm1103078ejt.105.2020.10.15.02.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2020 02:02:51 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: dwmw2@infradead.org, baolu.lu@linux.intel.com, joro@8bytes.org,
 zhangfei.gao@linaro.org, wangzhou1@hisilicon.com
Subject: [RFC PATCH 0/2] iommu: Avoid unnecessary PRI queue flushes
Date: Thu, 15 Oct 2020 11:00:27 +0200
Message-Id: <20201015090028.1278108-1-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>, kevin.tian@intel.com,
 ashok.raj@intel.com, arnd@arndb.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-pci@vger.kernel.org, linux-accelerators@lists.ozlabs.org
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

Add a parameter to iommu_sva_unbind_device() that tells the IOMMU driver
whether the PRI queue needs flushing. When looking at the PCIe spec
again I noticed that most of the time the SMMUv3 driver doesn't actually
need to flush the PRI queue. Does this make sense for Intel VT-d as well
or did I overlook something?

Before calling iommu_sva_unbind_device(), device drivers must stop the
device from using the PASID. For PCIe devices, that consists of
completing any pending DMA, and completing any pending page request
unless the device uses Stop Markers. So unless the device uses Stop
Markers, we don't need to flush the PRI queue. For SMMUv3, stopping DMA
means completing all stall events, so we never need to flush the event
queue.

First patch adds flags to unbind(), and the second one lets device
drivers tell whether the PRI queue needs to be flushed.

Other remarks:

* The PCIe spec (see quote on patch 2), says that the device signals
  whether it has sent a Stop Marker or not during Stop PASID. In reality
  it's unlikely that a given device will sometimes use one stop method
  and sometimes the other, so it could be a device-wide flag rather than
  passing it at each unbind(). I don't want to speculate too much about
  future implementation so I prefer having the flag in unbind().

* In patch 1, uacce passes 0 to unbind(). To pass the right flag I'm
  thinking that uacce->ops->stop_queue(), which tells the device driver
  to stop DMA, should return whether faults are pending. This can be
  added later once uacce has an actual PCIe user, but we need to
  remember to do it.

Jean-Philippe Brucker (2):
  iommu: Add flags to sva_unbind()
  iommu: Add IOMMU_UNBIND_FAULT_PENDING flag

 include/linux/intel-iommu.h |  2 +-
 include/linux/iommu.h       | 38 ++++++++++++++++++++++++++++++++++---
 drivers/iommu/intel/svm.c   | 10 ++++++----
 drivers/iommu/iommu.c       | 10 +++++++---
 drivers/misc/uacce/uacce.c  |  4 ++--
 5 files changed, 51 insertions(+), 13 deletions(-)

-- 
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
