Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 941057E79D
	for <lists.iommu@lfdr.de>; Fri,  2 Aug 2019 03:46:51 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5030B18F3;
	Fri,  2 Aug 2019 01:46:50 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id D864E18E8
	for <iommu@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 01:46:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id A291BE7
	for <iommu@lists.linux-foundation.org>;
	Fri,  2 Aug 2019 01:46:48 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id w24so32979380plp.2
	for <iommu@lists.linux-foundation.org>;
	Thu, 01 Aug 2019 18:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RdectgfrxPnoPm3S0YOxCABzXoqfRDNzFQDiE47h5Vs=;
	b=TY09FB3oduRwswYsXlYBN0hfEOMZHFs67R2ix0H5rE97soa1j1YHKiUNwyGO44M/iy
	71RT+aJ+oTzpdw0MwKYvn838kra3RTwW/eVouela+oW6XdLugu8NldyRHn2jobIy9+sw
	uEXhwwG/CSZu+Vl38cCE9vKx9mW7ALXIlbJsRSNOiia1rlqm6z7cjst19uwYaxDOFQeP
	yL/PUuRJ1PK4xPW4SZ8OvgF3Y26kOO5vfzh3dwqduAFc0+/fhC4nGRQmB5TOuTz0U2c/
	0JzVNwo9IAVDqP8B48B5HpUQTieRFKYP7ANZUWv0E+DOfyIi3bPRZgrvOd3FoWszir5B
	v5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=RdectgfrxPnoPm3S0YOxCABzXoqfRDNzFQDiE47h5Vs=;
	b=GYccj7ljw+2VgpLLGc5WPhLDMV7O8kx08lLXOCR+f2QvqhEPLZ+1Ggh+xZCSyy3YUx
	43w8OyjXrARhsaJ5tBxjeXI0UehJJCf0HIJESsjaNN98UoDINIPiSuYTk0sVIT+jn79E
	aYtBmSJKLuqd3JYtwY9KTj4xOiXIXgR/iiQIPzO4AnnD4s48iXBpvtcYjVAN2+8hJuDn
	YGPMDzFdifd9OwzXvEl7gubvigMOkeHwxzyxQidY/Qk3nVnVFdZPm0TROkv26MtvTr9A
	V98OwEBvIIJxLeEFRovH4D/P1b6puv4SXOd460pE+jnducHWrJdZ9FyqlF3I1tZ6qCTj
	PnnQ==
X-Gm-Message-State: APjAAAUoofq/wv0mH8IhB7z+hxw6qqCz0rupOO5IU/pz9xNBGtw0yprM
	CYYCwset4LhqagbLaP0mxyg=
X-Google-Smtp-Source: APXvYqz6v2LAs+vWsP5Ju77kwgKl89h9PYXGlo3CLDM3qT09S/MYoeAP/LE5J4NH3n4L///VC5y3Uw==
X-Received: by 2002:a17:902:324:: with SMTP id
	33mr125126557pld.340.1564710408379; 
	Thu, 01 Aug 2019 18:46:48 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
	by smtp.gmail.com with ESMTPSA id 5sm6703488pgh.93.2019.08.01.18.46.45
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 01 Aug 2019 18:46:47 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH v2 01/10] dma: debug: Replace strncmp with str_has_prefix
Date: Fri,  2 Aug 2019 09:46:43 +0800
Message-Id: <20190802014643.8681-1-hslester96@gmail.com>
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
So we prefer using newly introduced str_has_prefix
to substitute such strncmp.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v2:
  - Revise the description.

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
