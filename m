Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 5329038DB77
	for <lists.iommu@lfdr.de>; Sun, 23 May 2021 16:44:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F0DF605A2;
	Sun, 23 May 2021 14:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wart8xP4gnHc; Sun, 23 May 2021 14:44:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BC3460592;
	Sun, 23 May 2021 14:44:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3E8DAC0024;
	Sun, 23 May 2021 14:44:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2DE5C0001
 for <iommu@lists.linux-foundation.org>; Sun, 23 May 2021 14:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3D18402E9
 for <iommu@lists.linux-foundation.org>; Sun, 23 May 2021 14:32:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZVsEPJbWFFJ3 for <iommu@lists.linux-foundation.org>;
 Sun, 23 May 2021 14:32:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01673400BE
 for <iommu@lists.linux-foundation.org>; Sun, 23 May 2021 14:32:56 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id r1so3316376pgk.8
 for <iommu@lists.linux-foundation.org>; Sun, 23 May 2021 07:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=80oEOEMtjRDbSB+qf+VpWW8ktshD+Ev6RXgmcb2Yryg=;
 b=LJgraF0zltHesYML2Hh6g8kAJJKk1IY9s6V3w9sPul6auOktjjaN1eIVLaIj0gRRIA
 +GpEEfArRBpYmYt8FHuQbol/acDgcWlsyM/9pZBma4IKGnqFZPQ+a3aZbaduSBB5vXT1
 9/ZJ6KbDhc3mBPSmAC6US+zebuwf+Muk/JcWqUwVL+RDBxojmTqf76EIK5iLQQq3WDRb
 aaf6lgPM55SpuLlRf23nvNBfyzOiBFC7zQeIKXdLYAtagbS/IkiF3rvGmJEEYFaFu/Lw
 OXt4zdOxetI8SUnAC2fk3lTVdHkakdaHTPdYEzrIDN2lzyR68+Ed2vjv0VIytVDEd3Jf
 /5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=80oEOEMtjRDbSB+qf+VpWW8ktshD+Ev6RXgmcb2Yryg=;
 b=E2hbQYhbiS5F2pQnAFPH4t6vg3YYSMQtPMP4UriX5+9Eqn+1qXtLp0hi1sNYcFUKro
 raFe3uUGQZneJ5bWoL7+Ut42l6Yz46ndOPs00tNKKV4s5g8ISg4GrE8bYAC30zbyvtmD
 KAigJaV+VLuYaTdMDzawnL+77m6mRN9Bfh7I77seX+RZQjIY0cg6v1nIDOeSb8yXan6M
 yxu5KYfIerkMDt1VzHQdfnkZy5kWoFXa61/C1yq4Xioui7bDq89UOCVZfTydAca2U2gj
 evVkRbrh+trsIIp1CksfMtNJ6vNcGkbUJoZZYiUhn6GiJT8lHMelqg878GkVktfetBgf
 /VCQ==
X-Gm-Message-State: AOAM5319mM9XsiQazU/ZSAq3Wg+UXGneurN/Q+bfWPULzCa+oTb4X658
 chpaFBHJt3DckXomVlE1qPU=
X-Google-Smtp-Source: ABdhPJzsmevD/ZAiSNoaU4f+57udZ8vqYKNCuzS0Q5au4B6tdKmWAhLlEXYFD1QUxEedPEKXycOnsw==
X-Received: by 2002:a62:ab14:0:b029:2db:b3d9:1709 with SMTP id
 p20-20020a62ab140000b02902dbb3d91709mr19579788pff.80.1621780376223; 
 Sun, 23 May 2021 07:32:56 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:600d:a93f:c492:941f:bc2a:cc89])
 by smtp.googlemail.com with ESMTPSA id t1sm9365231pgl.40.2021.05.23.07.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 07:32:55 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: will@kernel.org
Subject: [PATCH] iommu/vt-d: fix kernel-doc syntax in file header
Date: Sun, 23 May 2021 20:02:45 +0530
Message-Id: <20210523143245.19040-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sun, 23 May 2021 14:44:11 +0000
Cc: yashsri421@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 rdunlap@infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, lukas.bulwahn@gmail.com, dwmw2@infradead.org
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

The opening comment mark '/**' is used for highlighting the beginning of
kernel-doc comments.
The header for drivers/iommu/intel/pasid.c follows this syntax, but
the content inside does not comply with kernel-doc.

This line was probably not meant for kernel-doc parsing, but is parsed
due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
causes unexpected warnings from kernel-doc:
warning: Function parameter or member 'fmt' not described in 'pr_fmt'

Provide a simple fix by replacing this occurrence with general comment
format, i.e. '/*', to prevent kernel-doc from parsing it.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 drivers/iommu/intel/pasid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/intel/pasid.c b/drivers/iommu/intel/pasid.c
index 72646bafc52f..aaffb226a6a9 100644
--- a/drivers/iommu/intel/pasid.c
+++ b/drivers/iommu/intel/pasid.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
-/**
+/*
  * intel-pasid.c - PASID idr, table and entry manipulation
  *
  * Copyright (C) 2018 Intel Corporation
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
