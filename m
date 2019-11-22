Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id B705D106C43
	for <lists.iommu@lfdr.de>; Fri, 22 Nov 2019 11:51:22 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A8AFB88B7C;
	Fri, 22 Nov 2019 10:51:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ie10OhoGpdD0; Fri, 22 Nov 2019 10:51:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2981F88B6E;
	Fri, 22 Nov 2019 10:51:19 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 162B5C18DA;
	Fri, 22 Nov 2019 10:51:19 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 17F89C18DA
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 10:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 0341B88B83
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 10:51:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2FND9CimFRpN for <iommu@lists.linux-foundation.org>;
 Fri, 22 Nov 2019 10:51:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id AC15D88B80
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 10:51:08 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id l17so6946326wmh.0
 for <iommu@lists.linux-foundation.org>; Fri, 22 Nov 2019 02:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vx4Rp2JWxTpwjHbsPUwQOJio9qv2Si3UTdoXXTOJ6hw=;
 b=RzMiAchIN0a1MA2agzsMmmUVN/NACrbKmeQxW9OYLy/xyPd/+bdzJ3ZJ1a0SCZIMfi
 1opvf0yvvJPDEs69SqH0j0177JHM9wAcPvQa0Gx7Qfznl9EMxk1LCPjTfQ/rzrY99sa9
 tj6hbbskL7HY5QzmcYnpJ7i7eRhpYkp7Wf4Uk4wk9S0J4GIQIVqnSyoESgxWxPktMOyg
 tzoZBhV6FQMgH8nP/3g1GYHXT/3k1thAdNwX9RVy6NoGRBnSI0wWuQUkd+LZicHh7Mrp
 w2x3EEBfT7ZqyQsIs5utEfoIRm2rYkYWXLhhZn6cJ8ThHpUuu7kXjmE83dXpl6mgyUgR
 1HUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vx4Rp2JWxTpwjHbsPUwQOJio9qv2Si3UTdoXXTOJ6hw=;
 b=Mk/NN6zJRzJ/npCbq9t8KSoRvIK2/1q39h1jry32U6lpCseB1cA0aBVyr1Nl1NTFpt
 xAXD4AbkB1awn+FB6uovQNfdoQv92m6A7qAaCoq14tlXL+nrPrIKQGbNI7prbRxRvqN9
 RbLOCMsNxIl9U98P8H2W/LJ3SYKnXnvHB0Nd9vSSXJiSd55Gam1GvQX9h8VGdIT3eydI
 tB+dB2mjCEbnhsg26chVCV9sQqX+PyYdolUSiUkZnhZwjx8YG9T84qypZU/3tJEhBvVh
 rEUtLltR9zE5yWg5DAOIRXGNFGJpEkcDs9X/Opgb2fshuToFx9cqSOtYuRo0xAvWlL9F
 UTdQ==
X-Gm-Message-State: APjAAAXtbzQP4Jma8p1HqtkBPkno6tgozXu47UFt1dqONCTqSchTbaRA
 QPxGkmYn3m0LgJHmsUo2zx1DvQ==
X-Google-Smtp-Source: APXvYqyZxbgndRY6b3Fh3ipFtYb3tNJ6jmpmtk3V3fd+ZYBSzCjLSNTlmzWGkB0HHefvBHwBmcEmHA==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr16254886wmc.130.1574419867091; 
 Fri, 22 Nov 2019 02:51:07 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-204-106.adslplus.ch.
 [188.155.204.106])
 by smtp.gmail.com with ESMTPSA id o133sm2088197wmb.4.2019.11.22.02.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Nov 2019 02:51:06 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org,
 virtualization@lists.linux-foundation.org, linux-pci@vger.kernel.org,
 virtio-dev@lists.oasis-open.org
Subject: [RFC virtio 12/13] virtio-iommu: Add built-in topology description
Date: Fri, 22 Nov 2019 11:49:59 +0100
Message-Id: <20191122105000.800410-13-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191122105000.800410-1-jean-philippe@linaro.org>
References: <20191122105000.800410-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: kevin.tian@intel.com, mst@redhat.com, gregkh@linuxfoundation.org,
 sudeep.holla@arm.com, rjw@rjwysocki.net, sebastien.boeuf@intel.com,
 jacob.jun.pan@intel.com, guohanjun@huawei.com, bhelgaas@google.com,
 jasowang@redhat.com, lenb@kernel.org
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

Add a lightweight method to describe the IOMMU topology in the config
space, guarded by a new feature bit. A list of capabilities in the
config space describes the devices managed by the IOMMU and their
endpoint IDs.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 virtio-iommu.tex | 88 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/virtio-iommu.tex b/virtio-iommu.tex
index 28c562b..2b29873 100644
--- a/virtio-iommu.tex
+++ b/virtio-iommu.tex
@@ -67,6 +67,9 @@ \subsection{Feature bits}\label{sec:Device Types / IOMMU Device / Feature bits}
 
 \item[VIRTIO_IOMMU_F_MMIO (5)]
   The VIRTIO_IOMMU_MAP_F_MMIO flag is available.
+
+\item[VIRTIO_IOMMU_F_TOPOLOGY (6)]
+  Topology description is available at \field{topo_offset}.
 \end{description}
 
 \drivernormative{\subsubsection}{Feature bits}{Device Types / IOMMU Device / Feature bits}
@@ -97,6 +100,7 @@ \subsection{Device configuration layout}\label{sec:Device Types / IOMMU Device /
     le32 end;
   } domain_range;
   le32 probe_size;
+  le16 topo_offset;
 };
 \end{lstlisting}
 
@@ -141,6 +145,90 @@ \subsection{Device initialization}\label{sec:Device Types / IOMMU Device / Devic
 If the driver does not accept the VIRTIO_IOMMU_F_BYPASS feature, the
 device SHOULD NOT let endpoints access the guest-physical address space.
 
+\subsubsection{Built-in topology description}\label{sec:Device Types / IOMMU Device / Device initialization / topology}
+
+The device manages memory accesses from endpoints, identified by endpoint
+IDs. The driver can discover which endpoint ID corresponds to an endpoint
+using several methods, depending on the platform. Platforms described
+with device tree use the \texttt{iommus} and \texttt{iommu-map} properties
+embedded into device nodes for this purpose. Platforms described with
+ACPI use a table such as the Virtual I/O Table. Platforms that do not
+support either device tree or ACPI may embed a minimalistic description
+in the device configuration space.
+
+An important disadvantage of describing the topology from within the
+device is the lack of initialization ordering information. Out-of-band
+descriptions such as device tree and ACPI let the operating system know
+about device dependencies so that it can initialize supplier devices
+(IOMMUs) before their consumers (endpoints). Platforms using the
+VIRTIO_IOMMU_F_TOPOLOGY feature have to communicate the device dependency
+in another way.
+
+If the VIRTIO_IOMMU_F_TOPOLOGY feature is negotiated, \field{topo_offset}
+is the offset between the beginning of the device-specific configuration
+space (virtio_iommu_config) and the first topology structure header. A
+topology structures defines the endpoint ID of one or more endpoints
+managed by the virtio-iommu device.
+
+\begin{lstlisting}
+struct virtio_iommu_topo_head {
+  le16 type;
+  le16 next;
+};
+\end{lstlisting}
+
+\field{next} is the offset between the beginning of the device-specific
+configuration space and the next topology structure header. When
+\field{next} is zero, this is the last structure.
+
+\field{type} describes the type of structure:
+\begin{description}
+  \item[VIRTIO_IOMMU_TOPO_PCI_RANGE (0)] struct virtio_iommu_topo_pci_range
+  \item[VIRTIO_IOMMU_TOPO_ENDPOINT (1)] struct virtio_iommu_topo_endpoint
+\end{description}
+
+\paragraph{PCI range}\label{sec:Device Types / IOMMU Device / Device initialization / topology / PCI range}
+
+\begin{lstlisting}
+struct virtio_iommu_topo_pci_range {
+  struct virtio_iommu_topo_head head;
+  le32 endpoint_start;
+  le16 hierarchy;
+  le16 requester_start;
+  le16 requester_end;
+  le16 reserved;
+};
+\end{lstlisting}
+
+The PCI range structure describes the endpoint IDs of a series of PCI
+devices.
+
+\begin{description}
+  \item[\field{hierarchy}] Identifier of the PCI hierarchy. Sometimes
+    called PCI segment or domain number.
+  \item[\field{requester_start}] First requester ID in the range.
+  \item[\field{requester_end}] Last requester ID in the range.
+  \item[\field{endpoint_start}] First endpoint ID.
+\end{description}
+
+The correspondence between a PCI requester ID in the range
+[ requester_start; requester_end ] and its endpoint IDs is a linear
+transformation: endpoint_id = requester_id - requester_start +
+endpoint_start.
+
+\paragraph{Single endpoint}\label{sec:Device Types / IOMMU Device / Device initialization / topology / Single endpoint}
+
+\begin{lstlisting}
+struct virtio_iommu_topo_endpoint {
+  struct virtio_iommu_topo_head head;
+  le32 endpoint;
+  le64 address;
+};
+\end{lstlisting}
+
+\field{endpoint} is the ID of a single endpoint, identified by its first
+MMIO address in the physical address space.
+
 \subsection{Device operations}\label{sec:Device Types / IOMMU Device / Device operations}
 
 Driver send requests on the request virtqueue, notifies the device and
-- 
2.24.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
