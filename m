Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B51A872BE
	for <lists.iommu@lfdr.de>; Fri,  9 Aug 2019 09:10:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 18B3BC79;
	Fri,  9 Aug 2019 07:10:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E2FF1C6D
	for <iommu@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 07:10:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 9F13476F
	for <iommu@lists.linux-foundation.org>;
	Fri,  9 Aug 2019 07:10:14 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id o13so45379812pgp.12
	for <iommu@lists.linux-foundation.org>;
	Fri, 09 Aug 2019 00:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AfFInu/BKl5gok1YyMJiKglvG/hgOvmiC2oJHUZbiVA=;
	b=qnGtnDamMWxXkDvOfVvqZyiG6ESs3LPrdiIFipKW0wSvRvybAaPD6u37c/y+Acoxl5
	WcyXF6qUzNvxq9ql7r5zVsKIrKNF6L629QOCJF+cMyfo8LL+m4L+kas/k9Z4REFndMw9
	Ma/5yipfNJ0LrB5NNa4xGgCzqc3BNHGZ8C5CBQ6nKC5fULk8MJgDqoc6WSVQMGUTLNIi
	RWKkW5eTgoovXCx8d2pLjD4muWZYJdK4s1gfk+sDHLMVec5Zam0ER72GybKZGyuhS8KD
	W8ovG9Oe+OzKUSVXog6pgZmJDGg26HIq7jDbIxKADkCXHo0pjEpkXFluSrfOGAjLTkPv
	H4xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=AfFInu/BKl5gok1YyMJiKglvG/hgOvmiC2oJHUZbiVA=;
	b=LNQyzQoazOzIlU95M1M4MSr1eT68eU/7vM26TfL6xAZT4rBiYRmRONunl0wKz6ZJyZ
	+zS67/Y2gHMVKXzi0K8uTMsvX4dyddNxOYmySIpMHF4GyJ+aiOnINcc5IvtBIDw3SfCy
	QRKQqLljBcmFawdq37PbtMBQwIHbPBsTeR7ALjRaBu3IX5pcXiX1+8cGNpMa5nw76RAe
	HXgqzVyh22SJrkbzGoavcU7Fz47Zd31z+PaNffk5BltRmY8SiuOd9gG1kAQDnql2cALG
	YsfA/E5pdq2WZdE1+VBryfYXsxpLg8/i7WG8wKWba+8Amzi2FIgXD6uu5SJvYd/mONrF
	omwg==
X-Gm-Message-State: APjAAAXtKqVr+FjNxOh4qmyMIwLj4eIZ2Yhu/LnIlr2fYINiFvmm/zAr
	S4ZkD1J7CS2YJyQyvoH2E/Q=
X-Google-Smtp-Source: APXvYqyCJqVbpv6emN3HFwU1RDjesGU99ywfAwLyfs9TJwWgVvpkgL6a+uXlTNL0WPBQjy2+H6017g==
X-Received: by 2002:a62:1444:: with SMTP id 65mr19563170pfu.145.1565334614339; 
	Fri, 09 Aug 2019 00:10:14 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
	by smtp.gmail.com with ESMTPSA id
	w4sm120886334pfn.144.2019.08.09.00.10.11
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 09 Aug 2019 00:10:13 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH v4 1/8] dma: debug: Replace strncmp with str_has_prefix
Date: Fri,  9 Aug 2019 15:10:09 +0800
Message-Id: <20190809071009.17114-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

strncmp(str, const, len) is error-prone because len
is easy to have typo.
The example is the hard-coded len has counting error
or sizeof(const) forgets - 1.
So we prefer using newly introduced str_has_prefix()
to substitute such strncmp to make code better.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 kernel/dma/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
index 099002d84f46..0f9e1aba3e1a 100644
--- a/kernel/dma/debug.c
+++ b/kernel/dma/debug.c
@@ -970,7 +970,7 @@ static __init int dma_debug_cmdline(char *str)
 	if (!str)
 		return -EINVAL;
 
-	if (strncmp(str, "off", 3) == 0) {
+	if (str_has_prefix(str, "off")) {
 		pr_info("debugging disabled on kernel command line\n");
 		global_disable = true;
 	}
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
