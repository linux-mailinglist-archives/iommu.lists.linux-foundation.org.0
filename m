Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FBA266A6C
	for <lists.iommu@lfdr.de>; Fri, 11 Sep 2020 23:56:24 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 117CD87AFC;
	Fri, 11 Sep 2020 21:56:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TJGsHrE2Ytqb; Fri, 11 Sep 2020 21:56:22 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F0B9387B1D;
	Fri, 11 Sep 2020 21:56:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D39E4C0051;
	Fri, 11 Sep 2020 21:56:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39779C0051
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 21:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1E5502E2CE
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 21:56:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NiIsHe9Cr9iK for <iommu@lists.linux-foundation.org>;
 Fri, 11 Sep 2020 21:56:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 203BD2E2DD
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 21:56:08 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 7so7497506pgm.11
 for <iommu@lists.linux-foundation.org>; Fri, 11 Sep 2020 14:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7BjSVtSDf909ReswhXA+neV/Kc6sD4bi71wx2N5H7LU=;
 b=A8C+o+2fd8UsmwGVQND5DGvINunw0u7Dvp69GukWmaRVU8xVfnKpMMNTRwvGxX6qIx
 vTnQk02zBTtODhO0Cg11VU+E+zQmJK7GUowXrTHH88wY8oiyLsgMrCdiPSVhLOTm+ZFf
 LjClNr82QTpY8pFxaD7UTNolbP6HEK/84d942CI8nVbJzPr9dgcv6rNccexNn/MUHLWr
 QqRv9JqKMScsV/eb2B3dUAEcyX/gQX8ziyd3Qq/XgRrdWGfIx7CWBgsbcK2WW3grL1Hr
 AF9G+nCkyUkqMQb5SRLAX7UfRPWqF5Kzm0O7hyAkFS3JNvkxaTczL9cP3ofJKSPcDtv6
 JKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7BjSVtSDf909ReswhXA+neV/Kc6sD4bi71wx2N5H7LU=;
 b=H8tk6/Inlm6XKtA1ubZVAXs75MUraZx4/PBWMurMSqBRRkNzLfzPkdsUJCoH6cTx5P
 N3aROvoSfij4kGPbqL3UKZ8BDvX2lkuCFOC7NiujDRzmHfjmit3kMk+j+tMGlzugNxAB
 fOEaGbLouThW9JXS8tN8W/LQURbIJiqIsZ2D7FROeQDuA9FmqA6gQDxQ487dc/yDfnBH
 WfS9VXBvG9kS2iAx3HakSPonxnHaJW0VAa7SJLpi/X4HWE6HGXqbnFtaA+ZLums3Ledr
 j7sK2VPLsnvSu6q7pCbCEuU54eRrPLj2A1u9HWWPioWmGxtthR/wFGfpbHl2nWdprnKL
 dyKQ==
X-Gm-Message-State: AOAM533e0DOQWyMCnIGn0a9YYvn4qX7vCF4AFCMFoT8RMzH0gieXMto4
 PbzAz6nnXUEEepyi3nOnrHkDwh6SXG4=
X-Google-Smtp-Source: ABdhPJxmwvCOhFLYI0HlF/wSBPLrK9ZM65jAoxM3LpnoRR+ftotb/M9S41OFO4PhAkpKeOz+04dVFg==
X-Received: by 2002:a65:5689:: with SMTP id v9mr3203008pgs.271.1599861367361; 
 Fri, 11 Sep 2020 14:56:07 -0700 (PDT)
Received: from jacob-builder.jf.intel.com (jfdmzpr04-ext.jf.intel.com.
 [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id e62sm3171586pfh.76.2020.09.11.14.56.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 11 Sep 2020 14:56:06 -0700 (PDT)
From: Jacob Pan <jacob.pan.linux@gmail.com>
X-Google-Original-From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Lu Baolu" <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v9 0/7] IOMMU user API enhancement
Date: Fri, 11 Sep 2020 14:57:49 -0700
Message-Id: <1599861476-53416-1-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 Yi Sun <yi.y.sun@intel.com>, Jean-Philippe Brucker <jean-philippe@linaro.com>,
 Wu Hao <hao.wu@intel.com>
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

IOMMU user API header was introduced to support nested DMA translation and
related fault handling. The current UAPI data structures consist of three
areas that cover the interactions between host kernel and guest:
 - fault handling
 - cache invalidation
 - bind guest page tables, i.e. guest PASID

Future extensions are likely to support more architectures and vIOMMU features.

In the previous discussion, using user-filled data size and feature flags is
made a preferred approach over a unified version number.
https://lkml.org/lkml/2020/1/29/45

In addition to introduce argsz field to data structures, this patchset is also
trying to document the UAPI design, usage, and extension rules. VT-d driver
changes to utilize the new argsz field is included, VFIO usage is to follow.

This set is available at:
https://github.com/jacobpan/linux.git vsva_v5.9_uapi_v9

Thanks,

Jacob


Changelog:
v9
	- Directly pass PASID value to iommu_sva_unbind_gpasid() without
	  the superfluous data in struct iommu_gpasid_bind_data.
v8
	- Rebased to v5.9-rc2
	- Addressed review comments from Eric Auger
	  1. added a check for the unused vendor flags
	  2. commit message improvements
v7
	- Added PASID data format enum for range checking
	- Tidy up based on reviews from Alex W.
	- Removed doc section for vIOMMU fault handling
v6
	- Renamed all UAPI functions with iommu_uapi_ prefix
	- Replaced argsz maxsz checking with flag specific size checks
	- Documentation improvements based on suggestions by Eric Auger
	  Replaced example code with a pointer to the actual code
	- Added more checks for illegal flags combinations
	- Added doc file to MAINTAINERS
v5
	- Addjusted paddings in UAPI data to be 8 byte aligned
	- Do not clobber argsz in IOMMU core before passing on to vendor driver
	- Removed pr_warn_ for invalid UAPI data check, just return -EINVAL
	- Clarified VFIO responsibility in UAPI data handling
	- Use iommu_uapi prefix to differentiate APIs has in-kernel caller
	- Added comment for unchecked flags of invalidation granularity
	- Added example in doc to show vendor data checking

v4
	- Added checks of UAPI data for reserved fields, version, and flags.
	- Removed version check from vendor driver (vt-d)
	- Relaxed argsz check to match the UAPI struct size instead of variable
	  union size
	- Updated documentation

v3:
	- Rewrote backward compatibility rule to support existing code
	  re-compiled with newer kernel UAPI header that runs on older
	  kernel. Based on review comment from Alex W.
	  https://lore.kernel.org/linux-iommu/20200611094741.6d118fa8@w520.home/
	- Take user pointer directly in UAPI functions. Perform argsz check
	  and copy_from_user() in IOMMU driver. Eliminate the need for
	  VFIO or other upper layer to parse IOMMU data.
	- Create wrapper function for in-kernel users of UAPI functions
v2:
	- Removed unified API version and helper
	- Introduced argsz for each UAPI data
	- Introduced UAPI doc


Jacob Pan (7):
  docs: IOMMU user API
  iommu/uapi: Add argsz for user filled data
  iommu/uapi: Introduce enum type for PASID data format
  iommu/uapi: Use named union for user data
  iommu/uapi: Rename uapi functions
  iommu/uapi: Handle data and argsz filled by users
  iommu/vt-d: Check UAPI data processed by IOMMU core

 Documentation/userspace-api/iommu.rst | 211 ++++++++++++++++++++++++++++++++++
 MAINTAINERS                           |   1 +
 drivers/iommu/intel/iommu.c           |  25 ++--
 drivers/iommu/intel/svm.c             |  13 ++-
 drivers/iommu/iommu.c                 | 201 ++++++++++++++++++++++++++++++--
 include/linux/iommu.h                 |  35 ++++--
 include/uapi/linux/iommu.h            |  25 ++--
 7 files changed, 468 insertions(+), 43 deletions(-)
 create mode 100644 Documentation/userspace-api/iommu.rst

-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
