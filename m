Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7454E4ACC71
	for <lists.iommu@lfdr.de>; Tue,  8 Feb 2022 00:04:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 291D0404CF;
	Mon,  7 Feb 2022 23:03:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x58QOZ7R0Z8K; Mon,  7 Feb 2022 23:03:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 347C84043A;
	Mon,  7 Feb 2022 23:03:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0C498C000B;
	Mon,  7 Feb 2022 23:03:57 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 24DF0C0011
 for <iommu@lists.linux-foundation.org>; Mon,  7 Feb 2022 23:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4865340253
 for <iommu@lists.linux-foundation.org>; Mon,  7 Feb 2022 23:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=intel.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 78uo29POR8ED for <iommu@lists.linux-foundation.org>;
 Mon,  7 Feb 2022 23:03:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C1BB4049B
 for <iommu@lists.linux-foundation.org>; Mon,  7 Feb 2022 23:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644275031; x=1675811031;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ncFZ3GgiFenQLT9iFwTMGx9ZJmzYJBlebX18EhhOoaA=;
 b=m4FyjIJ2FPbKkEqaZteskZ5wk7Iwzt6feGfVkKw7fUGImfrhQqvW/WUI
 9b4ZAATxnw5ZSR7OEzCpAi0D7iNEm60izWAtdmL6mzi6CpKCKK2aiSecv
 nyTbfUudsa/eneRnj+SNUE4XAhqGXLzSMxUMOlYfyE/rYkmuDj1Fk9CKK
 S3H5f5/AZQBgYmAgNQdU3VP+BUVFhBX9aszXPwP1/7QBCQikCmKJDwi4g
 BDj4zeqP7h9oh+1H7aJ6Sv5JORBXmd6zzEgoTKOjLTOaVPW5fxmRIBxVt
 i910e0ypHamxvbJml+MuyoWb4CLbm20zySpb3QjqU28yx+13o13ZaQ7K4 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="248774782"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="248774782"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 15:03:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="540324104"
Received: from otcwcpicx3.sc.intel.com ([172.25.55.73])
 by orsmga008.jf.intel.com with ESMTP; 07 Feb 2022 15:03:07 -0800
From: Fenghua Yu <fenghua.yu@intel.com>
To: "Thomas Gleixner" <tglx@linutronix.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Andy Lutomirski" <luto@kernel.org>, "Tony Luck" <tony.luck@intel.com>,
 "Lu Baolu" <baolu.lu@linux.intel.com>, "Joerg Roedel" <joro@8bytes.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 "Jacob Pan" <jacob.jun.pan@linux.intel.com>,
 "Ashok Raj" <ashok.raj@intel.com>,
 "Ravi V Shankar" <ravi.v.shankar@intel.com>
Subject: [PATCH v4 11/11] docs: x86: Change documentation for SVA (Shared
 Virtual Addressing)
Date: Mon,  7 Feb 2022 15:02:54 -0800
Message-Id: <20220207230254.3342514-12-fenghua.yu@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220207230254.3342514-1-fenghua.yu@intel.com>
References: <20220207230254.3342514-1-fenghua.yu@intel.com>
MIME-Version: 1.0
Cc: Fenghua Yu <fenghua.yu@intel.com>, iommu@lists.linux-foundation.org,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
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

Since allocating, freeing and fixing up PASID are changed, the
documentation is updated to reflect the changes.

Originally-by: Ashok Raj <ashok.raj@intel.com>
Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
v3:
- Remove PASID refcount description (Thomas).

v2:
- Update life cycle info (Tony and Thomas).
- Update initial PASID value to INVALID_IOASID on fork().

 Documentation/x86/sva.rst | 53 ++++++++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 12 deletions(-)

diff --git a/Documentation/x86/sva.rst b/Documentation/x86/sva.rst
index 076efd51ef1f..1a22020735a3 100644
--- a/Documentation/x86/sva.rst
+++ b/Documentation/x86/sva.rst
@@ -104,18 +104,47 @@ The MSR must be configured on each logical CPU before any application
 thread can interact with a device. Threads that belong to the same
 process share the same page tables, thus the same MSR value.
 
-PASID is cleared when a process is created. The PASID allocation and MSR
-programming may occur long after a process and its threads have been created.
-One thread must call iommu_sva_bind_device() to allocate the PASID for the
-process. If a thread uses ENQCMD without the MSR first being populated, a #GP
-will be raised. The kernel will update the PASID MSR with the PASID for all
-threads in the process. A single process PASID can be used simultaneously
-with multiple devices since they all share the same address space.
-
-One thread can call iommu_sva_unbind_device() to free the allocated PASID.
-The kernel will clear the PASID MSR for all threads belonging to the process.
-
-New threads inherit the MSR value from the parent.
+PASID Life Cycle Management
+==========================
+
+PASID is initialized as INVALID_IOASID (-1) when a process is created.
+
+Only processes that access SVA-capable devices need to have a PASID
+allocated. This allocation happens when a process opens/binds an SVA-capable
+device but finds no PASID for this process. Subsequent binds of the same, or
+other devices will share the same PASID.
+
+Although the PASID is allocated to the process by opening a device,
+it is not active in any of the threads of that process. It's loaded to the
+IA32_PASID MSR lazily when a thread tries to submit a work descriptor
+to a device using the ENQCMD.
+
+That first access will trigger a #GP fault because the IA32_PASID MSR
+has not been initialized with the PASID value assigned to the process
+when the device was opened. The Linux #GP handler notes that a PASID has
+been allocated for the process, and so initializes the IA32_PASID MSR
+and returns so that the ENQCMD instruction is re-executed.
+
+On fork(2) or exec(2) the PASID is removed from the process as it no
+longer has the same address space that it had when the device was opened.
+
+On clone(2) the new task shares the same address space, so will be
+able to use the PASID allocated to the process. The IA32_PASID is not
+preemptively initialized as the PASID value might not be allocated yet or
+the kernel does not know whether this thread is going to access the device
+and the cleared IA32_PASID MSR reduces context switch overhead by xstate
+init optimization. Since #GP faults have to be handled on any threads that
+were created before the PASID was assigned to the mm of the process, newly
+created threads might as well be treated in a consistent way.
+
+Due to complexity of freeing the PASID and clearing all IA32_PASID MSRs in
+all threads in unbind, free the PASID lazily only on mm exit.
+
+If a process does a close(2) of the device file descriptor and munmap(2)
+of the device MMIO portal, then the driver will unbind the device. The
+PASID is still marked VALID in the PASID_MSR for any threads in the
+process that accessed the device. But this is harmless as without the
+MMIO portal they cannot submit new work to the device.
 
 Relationships
 =============
-- 
2.35.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
