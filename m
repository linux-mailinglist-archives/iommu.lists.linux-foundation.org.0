Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 5357210E5FE
	for <lists.iommu@lfdr.de>; Mon,  2 Dec 2019 07:34:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 07DCB87CE1;
	Mon,  2 Dec 2019 06:34:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gaSlTwok9MhX; Mon,  2 Dec 2019 06:34:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 8ACEB87CDB;
	Mon,  2 Dec 2019 06:34:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 72A9EC087F;
	Mon,  2 Dec 2019 06:34:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE5EFC087F
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 06:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DC3D585F5F
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 06:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c4dL_0zEWi0N for <iommu@lists.linux-foundation.org>;
 Mon,  2 Dec 2019 06:34:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0722185D97
 for <iommu@lists.linux-foundation.org>; Mon,  2 Dec 2019 06:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575268469;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type: content-transfer-encoding:content-transfer-encoding;
 bh=gNO8R65HqEDwD4PL26vK0xbrtWJhduQqPI+m3a6v2rw=;
 b=NyvISx8PegRtitX8krGLEfoXYAuDtkb4HIOrq/x5rrm7JybPaP+36GGURpXVHbCTFj+bHv
 LwnIlWVSA79emyOy5nCFqG3qZIFNCMaBzFkUV5maH9q4mwXbIn1arVMPWxuczeOyWNsqS0
 RCFPMghm7RnXqugDjGHb/GpAxQGSILw=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-HBi49EM5O8WuFU3I655sbA-1; Mon, 02 Dec 2019 01:34:26 -0500
Received: by mail-pf1-f198.google.com with SMTP id t13so17732716pfh.0
 for <iommu@lists.linux-foundation.org>; Sun, 01 Dec 2019 22:34:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:reply-to
 :mime-version:content-disposition;
 bh=JSCP3vGjGH9Cov+zhm8TgobszggLyYzzVNH1cqL3YN0=;
 b=X6ZGQXrMjDabtVhLzvCmJVf+kOOhBjVxzFPRiviisn9kZ327OnVEnw4soMJYyPk7kK
 bD33yLcDtxOFj7C0U7x1RCP6dCDVyXOBWyoU9kpgWUVb8FE843P1yoUXrceHORTGwdj3
 VtdZSzuccUQ0TfMXb+f64fvA1ksmxhE/tgUJZ5UFWM/dl1tSx1yivlsJ+F7x9TMgWMDD
 3EqYdMd4A9+1f/lQ6l/p/1MYk+RbyI1HWZnnhI+FfLYxRoXFwhhC5ihgttMuJL4sp80u
 Q4DdcLXvhlwpqL88V6GaI/W12vKshst5BpbCxiG9nmDKk0x4/XzOF1VPbvRnLiYjf9Vq
 uQlA==
X-Gm-Message-State: APjAAAWtjvUZmO3tyS6B6oQmeEoW3Iw9XPnqLNWhRLnansJ5Y3LiJY4F
 azWnNzSUrdYGL2M0hNDZdrkCanViC1DJ3Q0DsQYhaod4aXPlG5rAuk4kP9GS4rkPVvCjR2bQ3JO
 Z1NE2MRW3JGjwBNZ/rRQZEgiXXXOPQQ==
X-Received: by 2002:a63:e4e:: with SMTP id 14mr29834871pgo.237.1575268464917; 
 Sun, 01 Dec 2019 22:34:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqztjnFXkam+c868Pk2+ezfSG831E0DkJfVXFiQxEfxG2aqPBKbVzZpE2ovxlYsJBaOAl02Fig==
X-Received: by 2002:a63:e4e:: with SMTP id 14mr29834852pgo.237.1575268464577; 
 Sun, 01 Dec 2019 22:34:24 -0800 (PST)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
 by smtp.gmail.com with ESMTPSA id g9sm3483017pfm.150.2019.12.01.22.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Dec 2019 22:34:23 -0800 (PST)
Date: Sun, 1 Dec 2019 23:34:22 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: iommu@lists.linux-foundation.org, Joerg Roedel <joro@8bytes.org>,
 Lu Baolu <baolu.lu@linux.intel.com>
Subject: dmar pte read access not set error messages on hp dl388 gen8 systems
Message-ID: <20191202063422.3lyfoerkejig4num@cantor>
MIME-Version: 1.0
X-MC-Unique: HBi49EM5O8WuFU3I655sbA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
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
Reply-To: Jerry Snitselaar <jsnitsel@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

We are seeing DMAR PTE read access not set errors when booting a
kernel with default passthrough, both with a test kernel and with
a 5.4.0 kernel. Previously we would see a number of identity mappings
being set related to the rmrrs, and now they aren't seen and we get
the dmar pte errors as devices touch those regions. From what I can tell
currently df4f3c603aeb ("iommu/vt-d: Remove static identity map code")
removed the bit of code in init_dmars that used to set up those
mappings:

-       /*
-        * For each rmrr
-        *   for each dev attached to rmrr
-        *   do
-        *     locate drhd for dev, alloc domain for dev
-        *     allocate free domain
-        *     allocate page table entries for rmrr
-        *     if context not allocated for bus
-        *           allocate and init context
-        *           set present in root table for this bus
-        *     init context with domain, translation etc
-        *    endfor
-        * endfor
-        */
-       pr_info("Setting RMRR:\n");
-       for_each_rmrr_units(rmrr) {
-               /* some BIOS lists non-exist devices in DMAR table. */
-               for_each_active_dev_scope(rmrr->devices, rmrr->devices_cnt,
-                                         i, dev) {
-                       ret = iommu_prepare_rmrr_dev(rmrr, dev);
-                       if (ret)
-                               pr_err("Mapping reserved region failed\n");
-               }
-       }

si_domain_init now has code that sets identity maps for devices in rmrrs, but
only for certain devices.

With iommu=nopt, the system boots up without issue.

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
