Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3B0305FED
	for <lists.iommu@lfdr.de>; Wed, 27 Jan 2021 16:44:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 4D72085F69;
	Wed, 27 Jan 2021 15:44:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b4B6yFeQ-vum; Wed, 27 Jan 2021 15:44:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id BA25485F35;
	Wed, 27 Jan 2021 15:44:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A28C1C08A1;
	Wed, 27 Jan 2021 15:44:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 71896C013A
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 15:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 6DB55871F9
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 15:44:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vTFTpUZd6Si4 for <iommu@lists.linux-foundation.org>;
 Wed, 27 Jan 2021 15:44:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9B7DF871F0
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 15:44:45 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id i9so2081525wmq.1
 for <iommu@lists.linux-foundation.org>; Wed, 27 Jan 2021 07:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Iza7ai+1pJVkOiREPpK3tUFt/+4KEOcT4kmdIoRu1W4=;
 b=rbK1aLxadekkDLedlYkhXNNhT2RXl9ArKYIMq5P+xZUhGoeMuNK3hNiCz/AdZv7dFV
 OSkzpHq8cAXoa/SXmQczZVVsMDUa3zgVBPkpfFJsnMVHytFJ4lPtF7iVgQDdouVwknB6
 PKAJ3I0JTJnun9bq1lGNt8cZHMDadB4iIeVL949UJaWXlk8wdS6to9Ss+zGxoSi5GdbL
 rQVmX44XNm3Yoa6Lp0sLLAnANdFnGsOPlibkhusNtF+Vv0m8ZbNcxG4L4D1R1D/UxyLB
 XIv8tC7yp0wBkuUigCeJ+XCpBK2QPUanxRD8fKUUvRyaioR65KVTDBWpW69znMpePx9P
 xlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Iza7ai+1pJVkOiREPpK3tUFt/+4KEOcT4kmdIoRu1W4=;
 b=Ci1TnCRE3THMkjZmRP+ts5IYwUSiOH2YPy4p2RcGTIsi7HfFHObYL/p6LCbxl3Dvie
 /E8diJZGiLC5R/iF9j8pTkA+BsSzCDQU3YK4pLxQ0VlTG09KEOquWvZRuIaO/VtgHx1c
 5alOZaEJTu71fK7MFpWiJQiXXATWul+RV5T12riBlu/tVWieT8SniMMweaS4+3VK49zn
 DvwOxLMNXdQIYCnCAn8rd9oTOyK4GjwhFq9Y+u2TIbXzPl/ZKQ7535dyeRCSz/XsrM2K
 0mVJNoWwhfpUC4zJ+PEfJu5yEN4BYQzhrujWVVjEoNMlbXWQxkrkz4Zl7H2ymysFnoj0
 HCUw==
X-Gm-Message-State: AOAM5332W4owTtB81r0fab3pNmxkluR8kiRObVZmRRhgzAhl4mMgxrry
 MCf+JYOPx0R/9D2j4tOkIQ0JuQ==
X-Google-Smtp-Source: ABdhPJxueLPbEIo5H0DTOaZMTDZgKa24SKwcOb0gi9WAMioQDQ/yigHLDYzBi1GocdkersH1im+GCg==
X-Received: by 2002:a1c:2c0b:: with SMTP id s11mr4542706wms.13.1611762284206; 
 Wed, 27 Jan 2021 07:44:44 -0800 (PST)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id r13sm3046921wmh.9.2021.01.27.07.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 07:44:43 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v12 08/10] dt-bindings: document stall property for IOMMU
 masters
Date: Wed, 27 Jan 2021 16:43:21 +0100
Message-Id: <20210127154322.3959196-9-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210127154322.3959196-1-jean-philippe@linaro.org>
References: <20210127154322.3959196-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: vivek.gautam@arm.com, guohanjun@huawei.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, linux-acpi@vger.kernel.org,
 zhangfei.gao@linaro.org, lenb@kernel.org, devicetree@vger.kernel.org,
 kevin.tian@intel.com, Rob Herring <robh@kernel.org>, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, rjw@rjwysocki.net,
 iommu@lists.linux-foundation.org, sudeep.holla@arm.com, robin.murphy@arm.com,
 linux-accelerators@lists.ozlabs.org
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
2.30.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
