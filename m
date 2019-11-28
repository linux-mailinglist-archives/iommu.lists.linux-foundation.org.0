Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE1810C156
	for <lists.iommu@lfdr.de>; Thu, 28 Nov 2019 02:18:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5EF3983C53;
	Thu, 28 Nov 2019 01:18:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QNg4gMzZewfC; Thu, 28 Nov 2019 01:18:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id EECA687120;
	Thu, 28 Nov 2019 01:18:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D2C3FC1DE5;
	Thu, 28 Nov 2019 01:18:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 32770C0881
 for <iommu@lists.linux-foundation.org>; Thu, 28 Nov 2019 01:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2C2C184138
 for <iommu@lists.linux-foundation.org>; Thu, 28 Nov 2019 01:18:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UTcMRpJm09eL for <iommu@lists.linux-foundation.org>;
 Thu, 28 Nov 2019 01:18:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id E46C7835CD
 for <iommu@lists.linux-foundation.org>; Thu, 28 Nov 2019 01:18:08 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id g3so26515147ljl.11
 for <iommu@lists.linux-foundation.org>; Wed, 27 Nov 2019 17:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=JMQdYJyn4DZq+HXMjxQakd49p+RuvCwuEXKGIF9rqTI=;
 b=td7BZspJ5Xsl83MelXI11nerSudeInN1dov3tywp9Hovx/ySwez9UXMND2e1ouhfG4
 /10vSg83C2Vhx5p8DHPlhZegPsUcnLpA6XUfIYIhq8X7TtXHqZmIb9eSq6BwZXXCApzx
 K45DuwlPrlJkDvz/dXPvOmdO9d9jlT2PM7z926PjB8RQMnBu3F46YCyq9uJSrpP7alwz
 4KEAKfJef/nezV3ly7DF/nK10VbbM6M2fFdbY1M5BRiLlRmbkR2VpTjfzij6FvxjtNvx
 M+og1v2CfIdYOLVFJlbzREX7jIM65vqK2twHNWTN4ae0qnZe/UJIxsmbc7q87OEvFosu
 XjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JMQdYJyn4DZq+HXMjxQakd49p+RuvCwuEXKGIF9rqTI=;
 b=heAscgmGXWC30Z6Dj6gyWG7tDeOTw8Hhw8197dT3mxq/KpFq8M8hewIJPQ4jKCD/De
 n7bZPkVfS65Hc2X/ZTVamaf8ydmorB35nK8FRbUf93rLsiVEPQK82H5/7QKOJVaycDzH
 flDedWFoYo2umTAi1m/wiDYCJ0I+xPHEXEPB/A1dG9utTpr/FgHgosgF3X7Akpvx9Oi5
 UPYZgpPsKbxjnUidtjvJ/LUDzu37WW36ZqmQf53exlS7HdY8rRFZZDHlZ+wwORnWG+Ns
 hg2AhR9iXnZ5BGEl9D5PAb56rubHSIEkoSYtArnRPzt155PyLRFhmc51O44iAjTFyM9a
 gZeg==
X-Gm-Message-State: APjAAAV9CO6EOOMfjNNI6bswGvGa0dVw13uZlnCVAjkFMbZVtU99nsYU
 vGc6owiX/x6Fy3YtCUMD/1Ihze2bDzLQC8MOd26PaHT/
X-Google-Smtp-Source: APXvYqwNI2Fn5vC7EN8OmFJ14kSZpXPfxH3nPk3/O6TZYFxT3mCT14/zMqKHMucTYlDtMco1octC6bGk+3BoFLsY54Q=
X-Received: by 2002:a2e:2283:: with SMTP id
 i125mr17406903lji.244.1574903886798; 
 Wed, 27 Nov 2019 17:18:06 -0800 (PST)
MIME-Version: 1.0
From: Aaron Gray <aaronngray.lists@gmail.com>
Date: Thu, 28 Nov 2019 01:17:50 +0000
Message-ID: <CANkmNDekywL6p7q48pG0_-RqF+LakRze8b7FPbR+kz620Ngwcw@mail.gmail.com>
Subject: How to read BIOS'es memory from IOMMU
To: iommu@lists.linux-foundation.org
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

Hi, I am interested in writing a program to verify BIOS integrity via
SHA512. Most modern BIOS'es seem to be accessible through IOMMU. I'm
wondering if there is a device driver for IOMMU or whether one could
be created for the purposes of accessing BIOS memory.

If anyone has any leads or advice or even can show me how to do this
in code via example/pseudo code I would appreciate it.

Regards,
Aaron

-- 
Aaron Gray

Independent Open Source Software Engineer, Computer Language
Researcher, Information Theorist, and amateur computer scientist.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
