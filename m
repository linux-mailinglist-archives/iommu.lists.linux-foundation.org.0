Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 17132189A54
	for <lists.iommu@lfdr.de>; Wed, 18 Mar 2020 12:14:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9E0BF86D59;
	Wed, 18 Mar 2020 11:14:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c8TbPrdHKBIz; Wed, 18 Mar 2020 11:14:29 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3464486D56;
	Wed, 18 Mar 2020 11:14:29 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 172B1C1D8E;
	Wed, 18 Mar 2020 11:14:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5E5A4C013E
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 11:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4ACE486D50
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 11:14:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cm_6n4r6OGqt for <iommu@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 11:14:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
 [209.85.160.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 542A386D4D
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 11:14:27 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id f20so298693qtq.6
 for <iommu@lists.linux-foundation.org>; Wed, 18 Mar 2020 04:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=sgyNbxuqyjr0qsNo2fb06dE8sRE+6o19+81LTsUoSA0=;
 b=gFYEGhVsLWDPfb3FaC35adoF5ttqjS3XQlnxbKwP7zr2CA3rvPiHtWlUnOee9N5KDD
 R8EK3pw05OTxaGnz+whhkBEY687jvqKt/vOWv1rQK5EXc50dVaLSBvG23hSUdDn5QUn3
 C2hwmfJhGQEo0CAtdC/S60wNPmxer7D/lhj1rWt9k5mQNGy6c/gwcNcIqc3v8dYyJR16
 Pl/ZZpdrszp1DxAfkTBVqcMKOb/p+6jrVMHeSr1Hq51THjKThrMUYukNj0EuHDDBus4p
 AGeF8iSaDnZnaboV3ok/lfVlHTDxWbnl9z+BggsU5ljj5C3Fx/uXMohmr0zIYx94AnJ8
 hSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=sgyNbxuqyjr0qsNo2fb06dE8sRE+6o19+81LTsUoSA0=;
 b=MOK3PbNKsPVoD0jeHhvjI1VDyqjPa9bw3VjPudovrBNyxavJjTuNFtyq/GLNhLxxi/
 8rkWp40/ulox9l/qrhzd08rKgTM2rSvEfcykKMyhjO2wB7lCM8/GgYPlped7Ni0MDIM7
 TotWvE6p6ktXCHaMh2CcqnJA3quECBtEdRxZ8j2Ztx3LpB0FFr6ERFiEalU6A1w0kpQm
 5hXU48nR7EBN484J5ZOCCqWn6gxDhe3/Mi2j1/ae0RHxOZx2hpOPC6Sbm77uYqUJ5FAE
 1p01vT2R7bFLWUa4l1qmeHS/pw25RJhF9BOePgnETjMAkC/W/c0iXNzuFNa4T/N64w9s
 5EYA==
X-Gm-Message-State: ANhLgQ1Ptv7Y4xEpCdHxkUxcn93aPu9Vsf+2ueoctAJppQCoHR52jsEE
 Lk4BemhdsPA1lF5VqD2E1zqv4w==
X-Google-Smtp-Source: ADFU+vungW6oo2qwG68CHP49iz0ohwYX3aEM++C6PAJnfZNPYYQOtB0SXA4Gw6VHTcAL2kirl1VGAQ==
X-Received: by 2002:ac8:3141:: with SMTP id h1mr3836627qtb.108.1584530066205; 
 Wed, 18 Mar 2020 04:14:26 -0700 (PDT)
Received: from [192.168.1.183] (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id g6sm4145161qtd.85.2020.03.18.04.14.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Mar 2020 04:14:25 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] iommu/vt-d: silence a RCU-list debugging warning
Date: Wed, 18 Mar 2020 07:14:24 -0400
Message-Id: <3F34A59D-2EB6-48A9-B758-2CB8B2EA1128@lca.pw>
References: <36b9e69b-ee3f-c17d-1788-64448ce8bc14@linux.intel.com>
In-Reply-To: <36b9e69b-ee3f-c17d-1788-64448ce8bc14@linux.intel.com>
To: Lu Baolu <baolu.lu@linux.intel.com>
X-Mailer: iPhone Mail (17D50)
Cc: iommu@lists.linux-foundation.org, jroedel@suse.de,
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



> On Mar 18, 2020, at 1:27 AM, Lu Baolu <baolu.lu@linux.intel.com> wrote:
> 
> How about changing the commit subject to
> "iommu/vt-d: Silence RCU-list debugging warning in dmar_find_atsr()"?

Just a bit long which should be non-issue.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
