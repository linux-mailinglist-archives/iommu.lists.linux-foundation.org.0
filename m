Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F50C3AF9D7
	for <lists.iommu@lfdr.de>; Tue, 22 Jun 2021 01:53:19 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76EA8607ED;
	Mon, 21 Jun 2021 23:53:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LtXYYJevODyr; Mon, 21 Jun 2021 23:53:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 897B6607DE;
	Mon, 21 Jun 2021 23:53:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6AB27C0022;
	Mon, 21 Jun 2021 23:53:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 76139C000E
 for <iommu@lists.linux-foundation.org>; Mon, 21 Jun 2021 23:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64269403EE
 for <iommu@lists.linux-foundation.org>; Mon, 21 Jun 2021 23:53:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=chromium.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X3vIiUCCuj6s for <iommu@lists.linux-foundation.org>;
 Mon, 21 Jun 2021 23:53:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3D4B403E6
 for <iommu@lists.linux-foundation.org>; Mon, 21 Jun 2021 23:53:13 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id g4so10952540pjk.0
 for <iommu@lists.linux-foundation.org>; Mon, 21 Jun 2021 16:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KLTgOAPTL/hdLPXehUk7jin9tlU4DA3I5amBsr+XFlI=;
 b=IakNO8AV5d2AjRngN+nO9dr4scVOZ/i0GXGfPwpIa86ahW3Gx5lGZr/Qvp7nX9QLEF
 ah2PHyMzxecYm5jvWAhtwLlNrNpFAqJF7xOfwTdlDZQDqN2rtdNZFIoQTtMU1ur4ZApC
 7UbMpvJg4P3n/t96Z0aCStxGsE3he4J8bRing=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KLTgOAPTL/hdLPXehUk7jin9tlU4DA3I5amBsr+XFlI=;
 b=W57gop42yTuJOKFOgdanlMEYH6KjxnNXw5SA6wKTopun2eVFfrqR0npJ2P1AIRzNWS
 7UC0NSuIhwQWdm1iRjIUJ5Xs4UMCGv8npR8r6586pw6KeRYoivFibkuzzw+7RzOBisnv
 vO+piv14jjqhXn9bb2E8qAd+ajTXApdr1MojtyGiR97KPAbgpN1RHOONqkyjY/F/QkXH
 o9+P7nzgCkHeRxpRKwzwjg8IcJ3QJCHu2m8KH2W4yWMxibI8N4FS1Ot/I3mtCC61uQ4H
 eCLcTTmFbTFDVZ+/csO+A7zdz4c1Oj0aI0VViUngy8RCY8n/2NpoUtdEZtdRhJrvkFyT
 PRZw==
X-Gm-Message-State: AOAM532wGdsvIanuvmgoVSnnhjkBEDDXyTMfmnJ6wRmHQiAjuBc7BCf1
 rAJ2Aj6GaXvj5L3RNxLS3TTZcw==
X-Google-Smtp-Source: ABdhPJwRWBAs+yleFm5GhcTuxr1KlXgWqhCk+RoJTuTTOnsjL0UiSKVoBvEouzqIK5zI5rTU5FaO7A==
X-Received: by 2002:a17:90a:be03:: with SMTP id a3mr611377pjs.43.1624319593246; 
 Mon, 21 Jun 2021 16:53:13 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:bdc1:a4b1:b06e:91d1])
 by smtp.gmail.com with ESMTPSA id s27sm4339663pfg.169.2021.06.21.16.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 16:53:12 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: gregkh@linuxfoundation.org, rafael@kernel.org, rafael.j.wysocki@intel.com,
 will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
 bjorn.andersson@linaro.org, ulf.hansson@linaro.org,
 adrian.hunter@intel.com, bhelgaas@google.com
Subject: [PATCH 2/6] drivers: base: Add bits to struct device to control iommu
 strictness
Date: Mon, 21 Jun 2021 16:52:44 -0700
Message-Id: <20210621165230.2.Icfe7cbb2cc86a38dde0ee5ba240e0580a0ec9596@changeid>
X-Mailer: git-send-email 2.32.0.288.g62a8d224e6-goog
In-Reply-To: <20210621235248.2521620-1-dianders@chromium.org>
References: <20210621235248.2521620-1-dianders@chromium.org>
MIME-Version: 1.0
Cc: robdclark@chromium.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-kernel@vger.kernel.org, saravanak@google.com,
 linux-arm-msm@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 linux-mmc@vger.kernel.org, quic_c_gdjako@quicinc.com,
 Douglas Anderson <dianders@chromium.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 iommu@lists.linux-foundation.org, linux-pci@vger.kernel.org,
 joel@joelfernandes.org, Dan Williams <dan.j.williams@intel.com>,
 rajatja@google.com, sonnyrao@chromium.org, vbadigan@codeaurora.org
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

How to control the "strictness" of an IOMMU is a bit of a mess right
now. As far as I can tell, right now:
* You can set the default to "non-strict" and some devices (right now,
  only PCI devices) can request to run in "strict" mode.
* You can set the default to "strict" and no devices in the system are
  allowed to run as "non-strict".

I believe this needs to be improved a bit. Specifically:
* We should be able to default to "strict" mode but let devices that
  claim to be fairly low risk request that they be run in "non-strict"
  mode.
* We should allow devices outside of PCIe to request "strict" mode if
  the system default is "non-strict".

I believe the correct way to do this is two bits in "struct
device". One allows a device to force things to "strict" mode and the
other allows a device to _request_ "non-strict" mode. The asymmetry
here is on purpose. Generally if anything in the system makes a
request for strictness of something then we want it strict. Thus
drivers can only request (but not force) non-strictness.

It's expected that the strictness fields can be filled in by the bus
code like in the patch ("PCI: Indicate that we want to force strict
DMA for untrusted devices") or by using the new pre_probe concept
introduced in the patch ("drivers: base: Add the concept of
"pre_probe" to drivers").

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 include/linux/device.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index f1a00040fa53..c1b985e10c47 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -449,6 +449,15 @@ struct dev_links_info {
  *		and optionall (if the coherent mask is large enough) also
  *		for dma allocations.  This flag is managed by the dma ops
  *		instance from ->dma_supported.
+ * @force_strict_iommu: If set to %true then we should force this device to
+ *			iommu.strict regardless of the other defaults in the
+ *			system. Only has an effect if an IOMMU is in place.
+ * @request_non_strict_iommu: If set to %true and there are no other known
+ *			      reasons to make the iommu.strict for this device,
+ *			      then default to non-strict mode. This implies
+ *			      some belief that the DMA master for this device
+ *			      won't abuse the DMA path to compromise the kernel.
+ *			      Only has an effect if an IOMMU is in place.
  *
  * At the lowest level, every device in a Linux system is represented by an
  * instance of struct device. The device structure contains the information
@@ -557,6 +566,8 @@ struct device {
 #ifdef CONFIG_DMA_OPS_BYPASS
 	bool			dma_ops_bypass : 1;
 #endif
+	bool			force_strict_iommu:1;
+	bool			request_non_strict_iommu:1;
 };
 
 /**
-- 
2.32.0.288.g62a8d224e6-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
