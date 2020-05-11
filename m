Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id D52A31CE083
	for <lists.iommu@lfdr.de>; Mon, 11 May 2020 18:33:47 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7DDD5881A8;
	Mon, 11 May 2020 16:33:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VnQecl441olH; Mon, 11 May 2020 16:33:45 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4A0BE87CE1;
	Mon, 11 May 2020 16:33:45 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 328D1C016F;
	Mon, 11 May 2020 16:33:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 44F35C016F
 for <iommu@lists.linux-foundation.org>; Mon, 11 May 2020 16:33:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 3133286D87
 for <iommu@lists.linux-foundation.org>; Mon, 11 May 2020 16:33:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6wOOSrnIDRsH for <iommu@lists.linux-foundation.org>;
 Mon, 11 May 2020 16:33:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 35F5086D7D
 for <iommu@lists.linux-foundation.org>; Mon, 11 May 2020 16:33:42 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id s10so9133828iln.11
 for <iommu@lists.linux-foundation.org>; Mon, 11 May 2020 09:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=et/ZymkirD1QygJLFDSmGkpZxp/V++5w/bxpZ0mAkxQ=;
 b=I7Mts3+ro62o7Ti94rrIyD0lIdQVdgJ6KCyjJLJF3I88OtJG7X+c0hKXo5Y8u0ec5N
 Po04BrhoAo0ZTA4qZlgwMoqipj8V44G3+ulzNGjpr3bHiZWsJGdm6AexFaeS/x4ZRwEM
 d0nm0LO5zZUDisAAmTkrRf3TRR9aC+PtGTxP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=et/ZymkirD1QygJLFDSmGkpZxp/V++5w/bxpZ0mAkxQ=;
 b=n40mDNdBZ/9eoh4O8p8yggEj+AicrUlYXJiJwcOFM+LFfBsR92S68+cBdoJQQg2kzF
 bwE7QBQfgXNVLMsP+nwUDlE28bgo6UQ38fe1vJl017hwEoqZgNjX+veXCCTnMz4CFnJw
 0jw2MzJlE+0zd2ajHGtSgdoVJESm7HPUgEezyq9X8l41VY4iMten30Hot9fvytmPO0qo
 i+GgWobXBgT76T7feuokbeoOYGbP6SnHsvv1qj9WjC3vq2zXGoZVWaFlX1d23zVjoQvk
 iSIBvvapXn/fGQBmWzjnCq0u5JzmgfK1tcmGnMdUzGSPw8RMElEV5u1IYze++cMDP2B6
 hgfw==
X-Gm-Message-State: AGi0PuaE8K/fzrMLCOYZGhZp67TWdNZSgR6LlnpY5X3G8ozRuo1ju/Xd
 t9tM/r6BPHJ64/nJ7RyIRbrILw==
X-Google-Smtp-Source: APiQypJf+O/nDuyRo72ouM16+AEuR7MSnpTCFjwQ5vLlX2G0HUePUY7lEyQcCHD/5B6ubI5Ionwh3Q==
X-Received: by 2002:a92:d186:: with SMTP id z6mr16579261ilz.119.1589214821511; 
 Mon, 11 May 2020 09:33:41 -0700 (PDT)
Received: from rrangel920.bld.corp.google.com
 (h184-60-195-141.arvdco.broadband.dynamic.tds.net. [184.60.195.141])
 by smtp.gmail.com with ESMTPSA id z86sm5312142ilk.79.2020.05.11.09.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 May 2020 09:33:40 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: Joerg Roedel <jroedel@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 iommu@lists.linux-foundation.org, linux-acpi@vger.kernel.org
Subject: [PATCH v2] iommu/amd: Fix get_acpihid_device_id()
Date: Mon, 11 May 2020 10:33:36 -0600
Message-Id: <20200511103229.v2.1.I6f1b6f973ee6c8af1348611370c73a0ec0ea53f1@changeid>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
MIME-Version: 1.0
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, dianders@chromium.org,
 Daniel Kurtz <djkurtz@chromium.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Raul E Rangel <rrangel@chromium.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, evgreen@chromium.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>
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

acpi_dev_hid_uid_match() expects a null pointer for UID if it doesn't
exist. The acpihid_map_entry contains a char buffer for holding the
UID. If no UID was provided in the IVRS table, this buffer will be
zeroed. If we pass in a null string, acpi_dev_hid_uid_match() will
return false because it will try and match an empty string to the ACPI
UID of the device.

Fixes: ae5e6c6439c3 ("iommu/amd: Switch to use acpi_dev_hid_uid_match()")
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Raul E Rangel <rrangel@chromium.org>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---

Changes in v2:
- Added Suggested by
- Fixed commit description
- Decided to keep `p->uid[0]` instead of `*p->uid` since the data member is an array instead of a pointer.
- Used clang-format

 drivers/iommu/amd_iommu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
index 20cce366e951..06f603366cb1 100644
--- a/drivers/iommu/amd_iommu.c
+++ b/drivers/iommu/amd_iommu.c
@@ -125,7 +125,8 @@ static inline int get_acpihid_device_id(struct device *dev,
 		return -ENODEV;
 
 	list_for_each_entry(p, &acpihid_map, list) {
-		if (acpi_dev_hid_uid_match(adev, p->hid, p->uid)) {
+		if (acpi_dev_hid_uid_match(adev, p->hid,
+					   p->uid[0] ? p->uid : NULL)) {
 			if (entry)
 				*entry = p;
 			return p->devid;
-- 
2.26.2.645.ge9eca65c58-goog

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
