Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D73A512947
	for <lists.iommu@lfdr.de>; Thu, 28 Apr 2022 04:02:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B33B340530;
	Thu, 28 Apr 2022 02:02:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YGiyict1JQlG; Thu, 28 Apr 2022 02:02:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id D1A304051D;
	Thu, 28 Apr 2022 02:02:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E520CC0089;
	Thu, 28 Apr 2022 02:02:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 90873C002D
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 01:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA1BA82438
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 01:10:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=sholland.org header.b="eaVtCutJ";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="S1i8lZN3"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kUJsHD9tUqso for <iommu@lists.linux-foundation.org>;
 Thu, 28 Apr 2022 01:10:47 +0000 (UTC)
X-Greylist: delayed 00:06:32 by SQLgrey-1.8.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8001481DBF
 for <iommu@lists.linux-foundation.org>; Thu, 28 Apr 2022 01:10:47 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 4B3E55C00CF;
 Wed, 27 Apr 2022 21:04:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Wed, 27 Apr 2022 21:04:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1651107856; x=1651194256; bh=kp
 LZSWY5pulSybgy+J3BHvwPqsyKhKZy8Hob8bLRgSg=; b=eaVtCutJFC89h8TSye
 kLgrAxKv7mv8BB3RX8FsQV7YUJ2RC/w2St56QIpWTwuaKQqVt3pY3LcqpBkjCpTT
 ykj3Q6ICT5Vr+U7/uxidw+apIT6qLv4EqbgmLYViSzNEfj0iPRHuNv8uLW2bKywN
 owiGCwiX9PP7aAXvm7RNZ+oLgUW9014iZ6QNK7bbHIdr6ADen10qKr4sFZh3l4FP
 +mXooRjN9vX9IpXnsrwOHbtJ1vc5DiwXsHmUyuTxBy0x2gEF5uUZxfJvXZPEJn5O
 oF89vHZzwRwlo2ZlS5EQC6S2qPOuo1a7fYSJbrdVYw6vK6ME9GpfuMASXFIc/jNT
 8y1A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651107856; x=1651194256; bh=kpLZSWY5pulSybgy+J3BHvwPqsyKhKZy8Ho
 b8bLRgSg=; b=S1i8lZN3lIqHPk2XZ+Jri1eBBAk0E5/ClkcJX4vi6nXmiPEVGZn
 TQe2QXLlGpBd71gc65+nXhUnTGXeq4f+3u0Mf5+vSPI5+pyEckyVg/YS4qfxP+GB
 EpzNx+cqUe/zzyxn7mChk8CU9LlrjeTd+jRHqcTmcZEktbGnDZAx6rvvO37+DbDx
 PS7ZN+D3NZoMRLc2o8ym+jst1ifJaUGBicHLvih4siw6clmK1j4/oadezgB2H29X
 OI+NvchmEfRxmmtCP+hFWjR/0BDIdwh2Ykc7vomhEBEJPgCDYHbg3+YJqPy8HiZS
 g8D/dz06+SXrsJhp+btgN0E/UH+yM4s8SdQ==
X-ME-Sender: <xms:EOhpYu5rICuAfhOyvhG3zBn6SsmosX9sa0QwBgkEGzgIVwutKwsCpw>
 <xme:EOhpYn7kI6lE-vmIDGjcCVFPEyCQyEptO7JZzaFPXy9zVq_mco20xBjT61625nrbI
 -F14DwV2cL1ssV7jw>
X-ME-Received: <xmr:EOhpYtfVGSM7evT-89FyD_wca4youZjNuT6WKzxWqty_q_y6GGHN5HE-eAMvtepPioOvRUK72_5KuYtch4XYvVEiwwLpjzvy2TvQugkWadzLXrdtQAhJmGn4CGVhD8GHIEAN6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeigdegvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
 feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:EOhpYrKiNgGyGRcR3093GrJAZecRwQTXKAhNGkHpj6jKimrQYutSuw>
 <xmx:EOhpYiL2yi74IQfBWUPtp7H7fZnFwVKJ2DUrSNOHFRItvIROIq7ifQ>
 <xmx:EOhpYsz0yymD3QJ07hXzkWy5mfkGQvCL7QgIYtQjpHLxs5GA_MMscw>
 <xmx:EOhpYn7jcvmGpZ7QiIF9HAPNh4dg0GCA_nU8OqiAJg5uBL8Myr4nsQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Apr 2022 21:04:15 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 iommu@lists.linux-foundation.org
Subject: [PATCH 1/5] dt-bindings: iommu: sun50i: Add compatible for Allwinner
 D1
Date: Wed, 27 Apr 2022 20:03:56 -0500
Message-Id: <20220428010401.11323-2-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428010401.11323-1-samuel@sholland.org>
References: <20220428010401.11323-1-samuel@sholland.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Apr 2022 02:02:11 +0000
Cc: devicetree@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
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

D1 contains an IOMMU similar to the one in the H6 SoC, but the D1
variant has no external reset signal.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 .../iommu/allwinner,sun50i-h6-iommu.yaml         | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml
index 5e125cf2a88b..18d3451d4dd5 100644
--- a/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml
+++ b/Documentation/devicetree/bindings/iommu/allwinner,sun50i-h6-iommu.yaml
@@ -17,7 +17,9 @@ properties:
       The content of the cell is the master ID.
 
   compatible:
-    const: allwinner,sun50i-h6-iommu
+    enum:
+      - allwinner,sun20i-d1-iommu
+      - allwinner,sun50i-h6-iommu
 
   reg:
     maxItems: 1
@@ -37,7 +39,17 @@ required:
   - reg
   - interrupts
   - clocks
-  - resets
+
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - allwinner,sun50i-h6-iommu
+
+then:
+  required:
+    - resets
 
 additionalProperties: false
 
-- 
2.35.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
