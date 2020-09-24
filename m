Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE8E277919
	for <lists.iommu@lfdr.de>; Thu, 24 Sep 2020 21:22:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7994A86B5C;
	Thu, 24 Sep 2020 19:22:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pWdbBoP4eDL4; Thu, 24 Sep 2020 19:22:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2B3FA86B72;
	Thu, 24 Sep 2020 19:22:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E8A6C0051;
	Thu, 24 Sep 2020 19:22:41 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 66E30C0051
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 19:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4D84386B5C
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 19:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qbwQolGP+lvE for <iommu@lists.linux-foundation.org>;
 Thu, 24 Sep 2020 19:22:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 8D0D686AC4
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 19:22:36 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id t7so294634pjd.3
 for <iommu@lists.linux-foundation.org>; Thu, 24 Sep 2020 12:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=JunQ1snjd9uj+r15M0gcbEm818SqQdfTuxCT2fUorJc=;
 b=nUs9HIfRvflse5Vo11G4iuMS99icrGDqiH/iskFQ6GYBN+1qjS+vgqhyeIjVx9AtrJ
 NVD5ZaQDZYK+pzm7u3YaCA62iOUcrgG7ALteynaIP9G5h/x/djphzDIZItSEejmvkqYL
 TgT1xI5vzHEwaKijIv44pNUD3wiOHrgrTxYOj4ckEEvJVGsb0NxarU7WmrMFDXor3nCS
 Z5IwgElqKZCqo9JlmGrYri2+PK4UIT6tC3B+rxWkENZWUWy+5g38D9N7sf3JqOVud06l
 DW0aLhROGgCqZtkx0vOs2wNtD24rflBHayGEVoxYNlCNX1ObmfRGm090fppsu8M7bB2i
 ps4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JunQ1snjd9uj+r15M0gcbEm818SqQdfTuxCT2fUorJc=;
 b=E7Iev/32U7Si9keiKiE+jebEvpjNyvgrv/P6z20BXQpFkD6kHw/b3eh84kWhhr8Wei
 /u1AoYyJ3X7LUG0T/znNoT6URHNsBsvsWTCXHXsiWTsEEaU5I6SFr4CIonbWFE61lZqO
 3Bhn5XkmJrih/Au+3PhQzG5eu2QKOkOS4rT1O0sDeP97e/BYj+Oo9snmnSkYtO/3zZ5i
 1ZX28SskJ4QrFwf1LKhtlQ4f69oD5Yp22QWQMwEA59WfVXK+bNBtgZhFwDw7fgyUTjB+
 Mno3m2WASdtMVanR7+meIiGsjrMFRqj0AZUV2Ppie56l2sskT9PQX9rWq6ADE5sdpFNR
 T6/g==
X-Gm-Message-State: AOAM531ID+Z08dFnGDPtSaqEbRJCCgmfAUfsu577hSnk5MUawpcZ5M7G
 8900mA0RjA1uHzvUQqQw/6/h+m6o6ws=
X-Google-Smtp-Source: ABdhPJx5IXV28i4bSJJjnskBx9ph7zUW+tF9/ITXvxgR4Ovrtt3mNFJyN2tWDB/4NmHjPbghdTNSXA==
X-Received: by 2002:a17:90a:9317:: with SMTP id
 p23mr414571pjo.160.1600975355815; 
 Thu, 24 Sep 2020 12:22:35 -0700 (PDT)
Received: from jacob-builder.jf.intel.com (jfdmzpr04-ext.jf.intel.com.
 [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id o15sm140918pgi.74.2020.09.24.12.22.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 24 Sep 2020 12:22:34 -0700 (PDT)
From: Jacob Pan <jacob.pan.linux@gmail.com>
X-Google-Original-From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Lu Baolu" <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v11 0/6] IOMMU user API enhancement
Date: Thu, 24 Sep 2020 12:24:14 -0700
Message-Id: <1600975460-64521-1-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Raj Ashok <ashok.raj@intel.com>,
 linux-api@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
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
https://github.com/jacobpan/linux.git vsva_v5.9_uapi_v11

Thanks,

Jacob


Changelog:
v11
	- Use #define instead of enum in PASID data format, squashed change
	  into "iommu/uapi: Handle data and argsz filled by users"
	- Remove alloc/free from documentation per Yi's comment. IOMMU UAPI
	  does not perform IOASID alloc/free.
v10
	- Documentation grammar fixes based on Randy's review
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

Jacob Pan (6):
  docs: IOMMU user API
  iommu/uapi: Add argsz for user filled data
  iommu/uapi: Use named union for user data
  iommu/uapi: Rename uapi functions
  iommu/uapi: Handle data and argsz filled by users
  iommu/vt-d: Check UAPI data processed by IOMMU core

 Documentation/userspace-api/iommu.rst | 209 ++++++++++++++++++++++++++++++++++
 MAINTAINERS                           |   1 +
 drivers/iommu/intel/iommu.c           |  25 ++--
 drivers/iommu/intel/svm.c             |  13 ++-
 drivers/iommu/iommu.c                 | 201 ++++++++++++++++++++++++++++++--
 include/linux/iommu.h                 |  35 ++++--
 include/uapi/linux/iommu.h            |  18 ++-
 7 files changed, 461 insertions(+), 41 deletions(-)
 create mode 100644 Documentation/userspace-api/iommu.rst

-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
