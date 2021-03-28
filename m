Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C5234C068
	for <lists.iommu@lfdr.de>; Mon, 29 Mar 2021 02:11:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B62B6607B1;
	Mon, 29 Mar 2021 00:10:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qwuj6hPsqvUy; Mon, 29 Mar 2021 00:10:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1AB1607B4;
	Mon, 29 Mar 2021 00:10:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F75BC001D;
	Mon, 29 Mar 2021 00:10:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B28D5C000A
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 948BA605A7
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:57:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oHU0VYZXelS1 for <iommu@lists.linux-foundation.org>;
 Sun, 28 Mar 2021 23:57:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0230A605BE
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 23:57:17 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id s2so8204102qtx.10
 for <iommu@lists.linux-foundation.org>; Sun, 28 Mar 2021 16:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ktllqx7QjnWspPMzXQ7sjhNooDB0vIxKm9ezXXcwic0=;
 b=f4QMuwyF5jrdPtMVo2+9CGy2hpnU6X9VG5or5cpG0i5tKec8GXJPvfE2Lpfk2UtaIc
 ESCMfIgnWL/UzyeGdrF5UBJ0iKYk2Q4qnsji667z2vAPF+u8CnsV9GYOtBno/G+/nqdq
 ZICRcmrtcXLksFUAwiGUvZpBxgizflQwSbKEaSuqDRxIqIeES2reI+kqyNZdZV2qHhv+
 GRJOMDGRqxSXoEJfkRzo2Xs8jWRYDGz0wMjhbIHXsUbZfochhQqfqzobUs0jKKMVgs/y
 AgbCDh9rd/1jlkPabHd0/Hk9bEm2jgro2YGuiorbB8cCG4HdzN8B20aMcPA+NJLNEqs2
 eH2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ktllqx7QjnWspPMzXQ7sjhNooDB0vIxKm9ezXXcwic0=;
 b=sBXwWBoGZKGGT/TK2qPKkUCHHslsa3/AwMX7HU8n/FQRsAw+MPvGMSJ/Wd1DVkD4so
 Wod1XTb5s5AIET1Q0auRt1GzdSo/ytbvNpvfdb5OC8T4lx4nD3QkRWF6xERT88sH4AwZ
 kuGgqWFEz3Dk1eGAOuy1Qhdm8YPAildVVMy+QOjkRqztyrotgFty7YLUs6/PFaJ81tyM
 aVxrHgdqFjaTOPwpZi4Ev9k+98RcyKzduV91T51dEJFH3BIaGsXHRjHZWglCF88BFJc/
 /EsA4tweXtu2/zXnG8lrjuH4CNUpe61cHMlATqff9l1vmFp828u6NCvLLV7slsQZOoMT
 jmfg==
X-Gm-Message-State: AOAM532iFtUJRuGlNyOsevFzAzxWsGsqKfDsmFW5zQb07XqMjJyGVmZP
 8ZwJQs9+yjVTBk4z85Hqt30=
X-Google-Smtp-Source: ABdhPJwxkLWZ5bJL30+ltWO6L6GdjSR/KZBPmPBB//wO0w+nDIDxzLuRqwzNpg9JihsmsPxrBn04TA==
X-Received: by 2002:ac8:7776:: with SMTP id h22mr21395212qtu.325.1616975836988; 
 Sun, 28 Mar 2021 16:57:16 -0700 (PDT)
Received: from localhost.localdomain ([156.146.58.24])
 by smtp.gmail.com with ESMTPSA id y19sm12153061qky.111.2021.03.28.16.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Mar 2021 16:57:16 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com
Subject: [PATCH 16/30] st_fdma.h: Fix couple of typos
Date: Mon, 29 Mar 2021 05:23:12 +0530
Message-Id: <e116ad3d06c03a655e4f8940ebfa4650c860ef3c.1616971780.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <cover.1616971780.git.unixbhaskar@gmail.com>
References: <cover.1616971780.git.unixbhaskar@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Mar 2021 00:10:51 +0000
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 linux-kernel@vger.kernel.org
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

s/transfert/transfer/  ...two different places.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/dma/st_fdma.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/st_fdma.h b/drivers/dma/st_fdma.h
index fa15b97a3bab..702b21021124 100644
--- a/drivers/dma/st_fdma.h
+++ b/drivers/dma/st_fdma.h
@@ -41,8 +41,8 @@ struct st_fdma_generic_node {
  * @saddr: Source address
  * @daddr: Destination address
  *
- * @generic: generic node for free running/paced transfert type
- * 2 others transfert type are possible, but not yet implemented
+ * @generic: generic node for free running/paced transfer type
+ * 2 others transfer type are possible, but not yet implemented
  *
  * The NODE structures must be aligned to a 32 byte boundary
  */
--
2.26.3

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
